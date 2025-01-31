import { Controller, Post, Body } from '@nestjs/common';

@Controller('form')
export class FormController {
  @Post()
  handleFormSubmit(@Body() formData: any) {
    console.log('Form data received:', formData);
    return { message: 'Form submitted successfully!', receivedData: formData };
  }
}
