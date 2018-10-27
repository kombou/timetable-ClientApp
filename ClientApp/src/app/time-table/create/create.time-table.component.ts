import {Component, OnInit} from '@angular/core';
import {FormControl, FormGroup, Validators} from '@angular/forms';
import {Time} from '../../models/Time';

@Component({
  templateUrl: 'create.time-table.component.html'
})
export class CreateTimeTableComponent implements OnInit {

  timeLineForm: FormGroup;

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
