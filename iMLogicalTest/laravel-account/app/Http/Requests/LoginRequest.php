<?php

namespace App\Http\Requests;

use Illuminate\Contracts\Validation\Validator;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;

class LoginRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'email' => 'required|email|regex:/(.+)@(.+)\.(.+)/i',
        ];
    }
    // function to return response for failed validation
    protected function failedValidation(Validator $validator)
    {
        $errors = $validator->errors();
        $response =
            [
                'meta' => [
                    'response_code' => 400,
                    'error_messages' => $errors->getMessages(),
                    'success_message' => '',
                    'pagination' => null,
                ],
                'data' => [],
            ];
        throw new HttpResponseException(response()->json($response)->setStatusCode(400));
    }
}
