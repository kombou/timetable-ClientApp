import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppComponent } from './app.component';
import {CoreModule} from './core/core.module';
import {TimeTableModule} from './time-table/time-table.module';
import {ClasseModule} from './classe/classe.module';
import {routing} from './app.routing';
import {ProgrammeModule} from './programme/programme.module';
import {SalleModule} from './salle/salle.module';
import {PeriodeModule} from './periode/periode.module';
import {JourModule} from './jour/jour.module';

@NgModule({
  declarations: [
    AppComponent
  ],
  imports: [
    BrowserModule,
    CoreModule,
    TimeTableModule,
    ClasseModule,
    ProgrammeModule,
    SalleModule,
    PeriodeModule,
    JourModule,
    routing
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
