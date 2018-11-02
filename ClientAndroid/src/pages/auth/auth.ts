import {Component, OnInit} from "@angular/core";
import {AuthServices} from "../../services/auth.services";
import {MenuController, NavController, NavParams, ToastController} from "ionic-angular";
import {FormBuilder, FormGroup, Validators} from "@angular/forms";
import {Compte} from "../../models/Compte";
import {TabsPage} from "../tabs/tabs";

@Component({
  selector: 'page-auth',
  templateUrl: './auth.html'
})
export class AuthPage implements OnInit{

  authForm: FormGroup;
  mode: string;
  errorMessage: any;
  constructor(private authService: AuthServices,
              private navParams: NavParams,
              private formBuilder: FormBuilder,
              private navCtrl: NavController,
              private toastCtrl: ToastController,
              private menuCtrl: MenuController)  {}

  ngOnInit() {
    this.mode = this.navParams.get('mode');
    this.createForm();
  }

  onToggleMenu() {
    this.menuCtrl.open();
  }

  createForm() {
    this.authForm = this.formBuilder.group({
      matricule: ['',Validators.required],
      password: ['',Validators.required]
    })
  }

  matricule() {
    return this.authForm.get('matricule');
  }
  password() {
    return this.authForm.get('password');
  }
  onSubmitForm() {
    const matricule = this.matricule().value;
    const password = this.password().value;

    if(this.mode === 'new') {
      let compte: Compte = new Compte(matricule, password);

      this.authService.createEnseignant(compte).then(user => {
        compte = user;
        this.navCtrl.setRoot(TabsPage);
      }).catch(err => {
        this.errorMessage = err;
        this.toastCtrl.create({
          message: 'Imposible de se connecté au serveur',
          duration: 3000,
          position: 'bottom'
        }).present();
      });
    } else if (this.mode === 'connect') {

      this.authService.signInUser(matricule, password).then(user => {

        this.authService.isAuth = true;
        this.navCtrl.setRoot(TabsPage);

      }).catch(err => {

        this.errorMessage = err.error;

        this.toastCtrl.create({
          message: `Erreur : ${err.error.Passhash}`,
          duration: 3000,
          position: 'bottom'
        }).present();
      });
    }
  }
}
