<?php

namespace App\Http\Controllers\Api\Public;

use App\Models\Submission;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Storage;
use App\Http\Resources\SubmissionResource;
use Illuminate\Support\Facades\Validator;

class SubmissionController extends Controller
{
    /**
     * Display a listing of the resource.
     * 
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        
        $submissions = Submission::when(request()->search, function($submissions) {
            $submissions = $submissions->where('nama', 'like', '%' . request()->search . '%');
        })->latest()->paginate(5);

        //append query string to pagination links
        $submissions->appends(['search' => request()->search]);

        //return with Api Resource
        return new SubmissionResource(true, 'List Data Submissions', $submissions);
    }

    /**
     * Store a newly created resource in storage.
     * 
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
     public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'nama'  => 'required',
            'email' => 'required',
            'nama_siswa'  => 'required',
            'kelas' => 'required',
            'sebagai' => 'required', 
            'deskripsi' => 'required', 
            'masalah' => 'required', 
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }
    
       
        $submission = Submission::create([
            'nama'  => $request->nama,
            'email' => $request->email,
            'kelas' => $request->kelas,
            'nama_siswa'  => $request->nama_siswa,
            'sebagai' => $request->sebagai,
            'deskripsi' => $request->deskripsi, 
            'masalah' => $request->masalah, 
        ]);

        if ($submission) {
            //return success with Api Resource
            return new SubmissionResource(true, 'Data Submission Berhasil Disimpan!', $submission);
        }

        //return failed with Api Resource
        return new SubmissionResource(false, 'Data Submission Gagal Disimpan!', null);
    }


    /**
     * Display the specified resource.
     * 
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $submission = Submission::whereId($id)->first();

        if ($submission) {
            //return success with Api Resource
            return new SubmissionResource(true, 'Detail Data Submission!', $submission);
        }

        //return failed with Api Resource
        return new SubmissionResource(false, 'Detail Data Submission Tidak Ditemukan!', null);
    }

    /**
     * Update the specified resource in storage.
     * 
     * @param \Illuminate\Http\Request $request
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Submission $submission)
    {
        $validator = Validator::make($request->all(), [
            'nama'      => 'required|unique:submissions,nama,' . $submission->id,
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        //check image update
        if ($request->file('image')) {

            //remove old image
            Storage::disk('local')->delete('public/categories/'.basename($category->image));

            //upload new image
            $image = $request->file('image');
            $image->storeAs('public/categories', $image->hashName());

            //update category with new image
            $category->update([
                'image' => $image->hashName(),
                'name'  => $request->name,
                'slug'  => Str::slug($request->name, '-'),
            ]);

    }

        //update category without image
        $category->update([
            'name' => $request->name,
            'slug' => Str::slug($request->name, '-'),
        ]);

        if ($category) {
            //return success with Api Resource
            return new CategoryResource(true, 'Data Category Berhasil Diupdate!', $category);
        }

        //return failed with Api Resource
        return new CategoryResource(false, 'Data Category Gagal Diupdate!', null);
    }

    /**
     * Remove the specified resource from storage.
     * 
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Category $category)
    {
        //remove image
        Storage::disk('local')->delete('public/categories/'.basename($category->image));

        if ($category->delete()) {
            //return success with Api Resource
            return new CategoryResource(true, 'Data Category Berhasil Dihapus', null);
        }

        //return failed with Api Resource
        return new CategoryResource(false, 'Data Category Gagal Dihapus!', null);
    }

    /**
     * all
     * 
     * @return void
     */
    public function all()
    {
        //get categories
        $categories = Category::latest()->get();

        //return with Api Resource
        return new CategoryResource(true, 'List Data Categories', $categories);
    }
}
