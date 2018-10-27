import {Component, OnInit} from '@angular/core';
import {FormControl, FormGroup, Validators} from '@angular/forms';
import {Time} from '../../models/Time';
import {ProgrammeRepository} from '../../programme/programme.repository';
import {Programme} from '../../models/Programme';
import {SalleRepository} from '../../salle/salle.repository';
import {Periode} from '../../models/Periode';
import {PeriodeRepository} from '../../periode/periode.repository';
import {JourRepository} from '../../jour/jour.repository';
import {Jour} from '../../models/Jour';
import {TimeTableRepository} from '../time-table.repository';

@Component({
  templateUrl: 'create.time-table.component.html'
})
export class CreateTimeTableComponent implements OnInit {

  timeLineForm: FormGroup;
  programmeList: Programme[] = [];
  salleList: Programme[] = [];
  periodeList: Periode[] = [];
  jourList: Jour[] = [];

  timeLine: Time;
  semestre: number;
  errors = {};

  constructor(
    private programmeRepository: ProgrammeRepository,
    private salleRepository: SalleRepository,
    private periodeRepository: PeriodeRepository,
    private jourRepository: JourRepository,
    private timeRepository: TimeTableRepository
  ) {

    this.programmeRepository.List().subscribe(l => {
      this.programmeList = l;
    });

    this.salleRepository.List().subscribe(l => {
      this.salleList = l;
    });

    this.periodeRepository.List().subscribe(p => {
      this.periodeList = p;
    });

    this.jourRepository.List().subscribe(j => {
      this.jourList = j;
    });
  }

  ngOnInit() {
    this.createForm();
    this.semestre = 1;
  }

  createForm() {
    this.timeLineForm = new FormGroup({
      programme: new FormControl('', Validators.required),
      salle: new FormControl('', Validators.required),
      periode: new FormControl('', Validators.required),
      jour: new FormControl('', Validators.required)
    });
  }
  get programme() {
    return this.timeLineForm.get('programme');
  }
  get salle() {
    return this.timeLineForm.get('salle');
  }
  get periode() {
    return this.timeLineForm.get('periode');
  }
  get jour() {
    return this.timeLineForm.get('jour');
  }

  onSubmitForm() {
    const formValue = this.timeLineForm.value;
    const time = new Time(
      formValue.programme,
      formValue.salle,
      formValue.periode,
      formValue.jour,
    );

    this.timeRepository.Add(time , this.semestre).subscribe(t => {
      this.timeLine = t;
      console.log(this.timeLine);
    }, r => {
      this.errors = r.error;
    });
  }
}
