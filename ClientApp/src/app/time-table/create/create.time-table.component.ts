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

@Component({
  templateUrl: 'create.time-table.component.html'
})
export class CreateTimeTableComponent implements OnInit {

  timeLineForm: FormGroup;
  programmeList: Programme[] = [];
  salleList: Programme[] = [];
  periodeList: Periode[] = [];
  jourList: Jour[] = [];

  constructor(
    private programmeRepository: ProgrammeRepository,
    private salleRepository: SalleRepository,
    private periodeRepository: PeriodeRepository,
    private jourRepository: JourRepository,
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
  }

  createForm() {
    this.timeLineForm = new FormGroup({
      programme: new FormControl('', Validators.required),
      salle: new FormControl('', Validators.required),
      periode: new FormControl('', [Validators.required, Validators.email]),
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
  }
}
