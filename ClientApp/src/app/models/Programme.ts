import {Ue} from './Ue';

export class Programme {
  constructor(
    public Id?: number,
    public IdIdclasse?: number,
    public Idue?: number,
    public idueNavigation?: Ue
  ) {}
}
