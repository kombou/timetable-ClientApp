import {NgModule} from '@angular/core';
import {BrowserModule} from '@angular/platform-browser';
import {ProgrammeRepository} from './programme.repository';
import {HttpClientModule} from '@angular/common/http';

@NgModule({
  declarations: [],
  imports: [BrowserModule, HttpClientModule],
  providers: [ProgrammeRepository]
})
export class ProgrammeModule {}
