<?php

namespace App\Http\Controllers;

use App\photo;
use Illuminate\Http\Request;

class ApiController extends Controller
{
    public function create(Request $request){
        $photo = new photo();

        $photo -> date = $request->input('date');
        $photo -> description = $request->input('description');
        $filename = "user_image.jpg";
        $path=$request->file('photo')->move(public_path("/"),$filename);
        $photoUrl=url('/'.$filename);
        return response()->json(['url'=>$photoUrl],200);
        $photo->save();
        return response()->json($photo);
    }

    public function retrieve(){
        $photo = photo::all();
        return response()->json($photo);


    }

    public function photoUpload(Request $request){

    }
}
