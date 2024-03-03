<?php

namespace App\Http\Controllers\Api\Public;
use App\Models\Chat;
use App\Models\User;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Resources\ChatResource;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;


class ChatController extends Controller
{
    /**
     * Display a listing of the resource
     * 
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $chats = Chat::with('user')
            ->when(request()->search, function($query) {
                return $query->where('penerima', 'like', '%'. request()->search . '%')
                             ->orWhere('pengirim', 'like', '%'. request()->search . '%');
            })
            ->where('penerima', auth()->user()->id)->orWhere('pengirim', auth()->user()->id)
            ->latest()
            ->paginate();

        //append query string to paginate links
        $chats->appends(['search' => request()->search]);

        //return with Api Resource
        return new ChatResource(true, 'List Data Posts', $chats);
    }

    /**
     * Store a newly created resource in storage
     * 
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store (Request $request)
    {
        $validator = Validator::make($request->all(), [
            'pengirim'       => 'required',
            'penerima'       => 'required',
            'chat' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);

        }  

        //upload image

        $chat  = Chat::create([
            'pengirim' => $request->pengirim,
            'penerima' => $request->penerima,
            'chat'     => $request->chat
        ]);

        //push notification firebase
        fcm()
            ->toTopic('push-notification')
            ->priority('normal')
            ->timeToLive(0)     
            ->notification([
                'title' => 'Berita Baru !',
                'body'  => 'Disini akan menampilkan judul berita baru',
                'click_action' => 'OPEN_ACTIVITY'
            ])
            ->send();

        if($chat) {
            //return success with Api Resource
            return new ChatResource(true, 'Data Post Berhasil Disimpan!', $chat);
        }

        //return failed with Api Resource
        return new ChatResource(false, 'Data Post Gagal Disimpan', null);

    }

    /**
     * Display teh specified resource.
     * 
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
{
    $chat = Chat::where('id', $id)
                ->where(function($query) {
                    $query->where('penerima', auth()->user()->id)
                          ->orWhere('pengirim', auth()->user()->id);
                })
                ->first();

    if ($chat) {
        // Jika chat ditemukan
        return new ChatResource(true, 'Data Chat berhasil ditemukan!', $chat);
    }

    // Jika chat tidak ditemukan
    return new ChatResource(false, 'Data Chat tidak ditemukan', null);
}


    /**
     * Update the specified resource in storage
     * 
     * @param \Illuminate\Http\Request $request
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function update (Request $request, Post $post)
    {
        $validator = Validator::make($request->all(), [
            'title'       => 'required|unique:posts, title,'.$post->id,
            'category_id' => 'required',
            'content'     => 'required'
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }  

         //check image update
         if ($request->file('image')) {

            //remove old image
            Storage::disk('local')->delete('public/posts/'.basename($post->image));

            //upload new image
            $image = $request->file('image');
            $image->storeAs('public/posts', $image->hashName());

            $post->update([
                'image'       => $image->hashName(),
                'title'       => $request->title,
                'slug'        => Str::slug($request->title, '-'),
                'category_id' => $request->category_id,
                'user_id'     => auth()->guard('api')->user()->id,
                'content'     => $request->content
            ]);

        }   

            $post->update([
                'title'       => $request->title,
                    'slug'        => Str::slug($request->title, '-'),
                    'category_id' => $request->category_id,
                    'user_id'     => auth()->guard('api')->user()->id,
                    'content'     => $request->content
            ]);

     
            if($post) {
                //return success with Api Resource
                return new PostResource(true, 'Data Post Berhasil Diupdate', $post);
            }
    
            //return failed with Api Resource
            return new PostResource(false, 'Data Post Gagal Diupdate', null);

        }

    /**
     * remove te specified resource from storage.
     * 
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Post $post)
    {
        //remove image
        Storage::disk('local')->delete('public/posts/'.basename($post->image));


        if($post->delete()) {
            //return success with Api Resource
            return new PostResource(true, 'Data Post Berhasil Dihapus', null);
        }

        //return failed with Api Resource
        return new PostResource(false, 'Data Post Gagal Dihapus', null);
    }
}