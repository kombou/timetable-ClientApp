import {NgModule} from '@angular/core';
import {BrowserModule} from '@angular/platform-browser';
import {ClasseComponent} from './classe/classe.component';
import {HttpClientModule} from '@angular/common/http';
import {Class} from './classe';
import {TimeTableRepository} from './time-table.repository';
import {CreateTimeTableComponent} from './create/create.time-table.component';
import {FormsModule, ReactiveFormsModule} from '@angular/forms';

@NgModule({
  declarations: [ClasseComponent, CreateTimeTableComponent],
  imports: [
    BrowserModule,
    HttpClientModule,
    ReactiveFormsModule,
    FormsModule
  ],
  exports: [ClasseComponent],
  providers: [Class, TimeTableRepository]
})
export class TimeTableModule {}
