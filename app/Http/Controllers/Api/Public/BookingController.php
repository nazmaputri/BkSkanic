<?php
    
        namespace App\Http\Controllers\Api\Public;

        use App\Models\Booking;
        use Illuminate\Support\Str;
        use Illuminate\Http\Request;
        use App\Http\Controllers\Controller;
        use App\Http\Resources\BookingResource;
        use Illuminate\Support\Facades\Storage;
        use Illuminate\Support\Facades\Validator;


        class BookingController extends Controller
        {
            /**
             * Display a listing of the resource
             * 
             * @return \Illuminate\Http\Response
             */
            public function index()
            {
                $bookings= Booking::with('user')
                // ->withCount('views')
                ->when(request()->search, function($bookings) {
                    $bookings = $bookings->where('title', 'like', '%'. request()->search . '%');
                })->where('id_users', auth()->user()->id)->latest()->paginate(5);

                //append query string to paginate links
                $bookings->appends(['search' => request()->search]);
                    
                //return with Api Resource
                return new BookingResource(true, 'List Data Bookings', $bookings);
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
                    'id_users'      => 'required',
                    'booking_start' => 'required',
                    'booking_end'   => 'required',
                    'name'          => 'required',
                    'email'         => 'required',
                    'no_telepon'    => 'required',
                    'problem'       => 'required',
                    'option'        => 'required',
                    'consultation'  => 'required',
                    'booking_date'  => 'required',
                    'status'        => 'required'

                ]);

                if ($validator->fails()) {
                    return response()->json($validator->errors(), 422);

                }  

                //upload image

                $booking  = Booking::create([
                    'booking_start' => $request->booking_start,
                    'booking_end'   => $request->booking_end,
                    'name'          => $request->name,
                    'email'         => $request->email,
                    'no_telepon'    => $request->no_telepon,
                    'problem'       => $request->problem,
                    'option'        => $request->option,
                    'consultation'  => $request->consultation,
                    'booking_date'  => $request->booking_date,
                    'id_users'      => $request->id_users,
                    'status'        => $request->status

                ]);

                //push notification firebase
                fcm()
                    ->toTopic('push-notification')
                    ->priority('normal')
                    ->timeToLive(0)
                    ->notification([
                        'title' => 'Jadwal Booking Baru !',
                        'body'  => 'Menampilkan nama siswa yang membuat temu janji',
                        'click_action' => 'OPEN_ACTIVITY'
                    ])
                    ->send();

                if($booking) {
                    //return success with Api Resource
                    return new BookingResource(true, 'Data Booking Berhasil Disimpan!', $booking);
                }

                //return failed with Api Resource
                return new BookingResource(false, 'Data Booking Gagal Disimpan', null);

            }

            /**
             * Display teh specified resource.
             * 
             * @param int $id
             * @return \Illuminate\Http\Response
             */
            public function show($id)
            {
                $booking = Booking::with('name')->whereId($id)->first();

                if($booking) {
                    //return success with APi Resource
                    return new BookingResource(true, 'Detail Data Booking', $booking);
                }

                //return failed with Api Resource
                return new BookingResource(false, 'Detail Data Post Tidak Ditemukan', null);
            }

            /**
             * Update the specified resource in storage
             * 
             * @param \Illuminate\Http\Request $request
             * @param int $id
             * @return \Illuminate\Http\Response
             */
            public function update(Request $request, $id)
        {
            // Temukan booking yang akan diperbarui
            $booking = Booking::find($id);

            // Jika booking tidak ditemukan, kembalikan response error 404
            if (!$booking) {
                return response()->json(['message' => 'Booking not found'], 404);
            }

            // Validasi input
            $validator = Validator::make($request->all(), [
                'id_users'       => 'required|exists:users,id',
                'booking_start'  => 'required',
                'booking_end'    => 'required',
                'name'           => 'required',
                'email'          => 'required',
                'no_telepon'     => 'required',
                'problem'        => 'required',
                'option'         => 'required',
                'consultation'   => 'required',
                'booking_date'   => 'required',
                'status'         => 'required'
            ]);

            // Jika validasi gagal, kembalikan response error 422
            if ($validator->fails()) {
                return response()->json($validator->errors(), 422);
            }

            // Perbarui data booking
            $booking->update([
                'id_users'       => $request->input('id_users'),
                'booking_start'  => $request->input('booking_start'),
                'booking_end'    => $request->input('booking_end'),
                'name'           => $request->input('name'),
                'email'          => $request->input('email'),
                'no_telepon'     => $request->input('no_telepon'),
                'problem'        => $request->input('problem'),
                'option'         => $request->input('option'),
                'consultation'   => $request->input('consultation'),
                'booking_date'   => $request->input('booking_date'),
                'status'         => $request->input('status')
            ]);

            // Jika booking berhasil diperbarui, kembalikan response sukses dengan data booking yang diperbarui
            return response()->json([
                'success' => true,
                'message' => 'Data Booking Berhasil Diperbarui!',
                'data'    => $booking,
            ]);
        }


            /**
             * remove te specified resource from storage.
             * 
             * @param int $id
             * @return \Illuminate\Http\Response
             */
            public function destroy($id)
        {
            // Temukan booking yang akan dihap  us
            $booking = Booking::find($id);

            // Jika booking tidak ditemukan, kembalikan response error 404
            if (!$booking) {
                return response()->json(['message' => 'Booking not found'], 404);
            }

            // Hapus booking
            $booking->delete();

            // Kembalikan response sukses dengan pesan berhasil
            return response()->json(['success' => true, 'message' => 'Booking berhasil dihapus']);
        }

        }