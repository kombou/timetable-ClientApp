import {Jour} from './Jour';

export class Time {
  constructor(
    public idprogramme?: number,
    public idsalle?: number,
    public idperiode?: number,
    public idjour?: number,
    public idjourNavigation?: Jour
  ) {}
}
