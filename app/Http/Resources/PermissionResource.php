<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class PermissionResource extends JsonResource
{
    public $status;
    public $message;
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */

    public function __construct($status,$message, $resorce)
    {
        parent::__construct($resorce);
        $this->status = $status;
        $this->message = $message;
    }

    public function toArray(Request $request): array
    {
        // return parent::toArray($request);
        return[
            'success'  => $this->status,
            'message'   => $this->message,
            'data'      => $this->resource,
        ];
    }
}
