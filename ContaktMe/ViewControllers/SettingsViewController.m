//
//  HomeViewController.m
//  BeepGoosh
//
//  Created by Riyad Anabtawi on 1/11/15.
//  Copyright (c) 2015 Riyad Anabtawi. All rights reserved.
//

#import "SettingsViewController.h"
#import "Incidencia.h"
#import "Functions.h"
#import "SBTVServices.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController{
    
    SBTVProgramPreview *preview;
    NSTimer *timer;
    NSTimer *timer2;
    BOOL finalizado;
    BOOL _autoupdateOptionsSelection;
    NSArray *_options;
    NSIndexPath *_selectedItemIndexPath;
    NSString *_escudo;
    NSIndexPath *_optionsSelectedIndex;



}
-(void)removeView{};
- (void)viewDidLoad {
    
    
    [self loadIncidences];
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    self.ScreenWidth.constant=screenWidth;
    [self.view layoutIfNeeded];
    if(IS_IPHONE_6Plus){
        self.topImage.constant=160;
        
        
        
    }else if(IS_IPHONE_6){
         self.ScreenWidth.constant=370;
        self.topImage.constant=170;
        [self.view layoutIfNeeded];
        self.scrollHeight.constant=700;
    }else if(IS_IPHONE_5){
        self.topImage.constant=160;
        [self.view layoutIfNeeded];
    }
    else if(IS_IPHONE_4){
        self.topImage.constant=180;
        self.scrollHeight.constant=680;
        [self.view layoutIfNeeded];
    }
    
    [self slideMenuSetup];
    User *user0=[User new];
    user0.name=@"Riyad Anabtawi";
    user0.status_message=@"Coding here and there";
    user0.city=@"Santiago";
    user0.avatar=@"riyad.jpg";
    user0.followed_by=@254;
    user0.state=@"online";

    user0.profession=@"IT Engineer";
    user0.mobilephone=@"+56-9-5784385";
    user0.birthPlace=@"Brazil";
    user0.workplace=@"CEO @ContaktMe";
    user0.email=@"riyadcarioca@gmail.com";
    user0.country=@"Chile";
   
   
   
    
    //    for (NSString *familyName in [UIFont familyNames]) {
    //        for (NSString *fontName in [UIFont fontNamesForFamilyName:familyName]) {
    //            NSLog(@"%@", fontName);
    //        }
    //    }
    [super viewDidLoad];
  
    self.view.backgroundColor=[Functions colorWithHexString:@"ffffff"];
    
    preview = [[SBTVProgramPreview alloc] init];
    
    
    preview.delegate=self;
    preview.controller=self;
    [preview setProgramsConfig:[NSArray arrayWithObject:user0] WithSelectedProgram:user0];
    
    [Functions fillContainerView:self.view WithView:preview];

    self.slideMenuMargin.constant=-240;
    self.blockUIview.alpha=0.0f;
    [self.view layoutIfNeeded];

    UIImageView *logo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"settings_title.png"]];
    
    logo.clipsToBounds = YES;
    logo.contentMode = UIViewContentModeScaleAspectFit;
    
    logo.frame=CGRectMake(logo.frame.origin.x, logo.frame.origin.y, 140, 20);
    UIView *logoContainer = [[UIView alloc] initWithFrame:logo.frame];
    [logoContainer addSubview:logo];
    
    self.navigationItem.titleView = logoContainer;
    self.navigationItem.leftBarButtonItem.title = @"";
      self.navigationController.navigationBar.topItem.title = @"";
    
    
    

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if([segue.identifier isEqualToString:@"shareMe"]){
        ShareContactViewController *controller = segue.destinationViewController;
        controller.delegate=self;
    
    }
    if ([segue.identifier isEqualToString:@"ChatRoom"]) {
        
        _incidenciasEncuentro = segue.destinationViewController;
        _incidenciasEncuentro.partido = _datosPartido;
        _incidenciasEncuentro.delegate = self;
        
 
        
        
    }
}





- (void)slideMenuSetup
{
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.navigationController.navigationBar removeGestureRecognizer:self.revealViewController.panGestureRecognizer];
       
        [self.navigationController.navigationBar setTintColor:[Functions colorWithHexString:@"F35e46"]];
    }
   }






-(IBAction)ShareContact:(id)sender{
    
    
    [self performSegueWithIdentifier:@"shareMe" sender:self];
    

}





-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView.tag==1) {
        if(scrollView.contentOffset.y<0){

            self.heightDrag.constant=scrollView.contentOffset.y-1.5;

            [self.view layoutIfNeeded];

        }else if(scrollView.contentOffset.y==0){
            return ;

        }

    }

}



-(void)scrollViewDidScrollToTop:(UIScrollView *)scrollView{
    

    
}



-(void)x{

    [UIView animateWithDuration:0.5 animations:^{
        
        self.slideShareImage.alpha=1.0f;
        self.tapView.alpha=0.0f;
        
        
    } completion:^(BOOL finished) {
        
    }];

}

-(void)dismiss:(id)sender{


    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}


-(void)ShowDrag{

  
        self.slideShareImage.alpha=0.0f;
    self.tapView.alpha=1.0f;
        [UIView animateWithDuration:0.5 animations:^{
      self.tapView.alpha=0.0f;
            self.slideShareImage.alpha=1.0f;
    
    
    
        } completion:^(BOOL finished) {
            
        }];


}
-(void)cargarincidencias:(IncidenciasEncuentro *)incidenciasEncuentro sucess:(void (^) (id responseObject)) completion {
    
    [timer invalidate];
    timer = nil;
    
    
    NSString * p = [NSString stringWithFormat:@""];
    [SBTVServices getWsUrl:@"datos_partido" params:p sucess:^(id responseObject) {
        
        
        NSLog(@"DATA REFRESH!!!!!!");
        
        _incidencias = [[NSMutableArray alloc] init];
        Incidencia *inicio = [[Incidencia alloc] init];
        inicio.idIncidencia = 14;
        inicio.minuto = 0;
        [_incidencias addObject:inicio];
        Incidencia *fin = [[Incidencia alloc] init];
        fin.idIncidencia = 15;
        fin.minuto = 90;
        [_incidencias addObject:fin];
        
        
        
        if ([responseObject count] == 0) {
            return;
        }
        _datosPartido.keyLocal = [[responseObject objectAtIndex:0] objectForKey:@"keyLocal"];
        _datosPartido.keyVisita = [[responseObject objectAtIndex:0] objectForKey:@"keyVisita"];
        _datosPartido.escudoVisita =[[responseObject objectAtIndex:0] objectForKey:@"escudoVisita"];
        _datosPartido.escudoLocal = [[responseObject objectAtIndex:0] objectForKey:@"escudoLocal"];
        _datosPartido.golesLocal = [[[responseObject objectAtIndex:0] objectForKey:@"golesLocal"] intValue];
        _datosPartido.golesVisita = [[[responseObject objectAtIndex:0] objectForKey:@"golesVisita"] intValue];
        _datosPartido.hora = [[responseObject objectAtIndex:0] objectForKey:@"hora"];
        _datosPartido.fecha = [[responseObject objectAtIndex:0] objectForKey:@"fecha"];
        _datosPartido.idLocal = [[[responseObject objectAtIndex:0] objectForKey:@"idLocal"] integerValue];
        _datosPartido.idVisita = [[[responseObject objectAtIndex:0] objectForKey:@"idVisita"] integerValue];
        _datosPartido.equipoLocal = [[responseObject objectAtIndex:0] objectForKey:@"nombreLocal"];
        _datosPartido.equipoVisita = [[responseObject objectAtIndex:0] objectForKey:@"nombreVisita"];
        
        
        for(NSDictionary *i in [[responseObject objectAtIndex:0] objectForKey:@"incidencia"]){
            
            Incidencia *incidencia = [[Incidencia alloc] init];
            incidencia.Incidencia = [[i objectForKey:@"incidencia"] integerValue];
            
            
            incidencia.teamId = [i objectForKey:@"teamId"];
            
            
            
            NSString *local = [NSString stringWithFormat: @"%d", (int)_datosPartido.idLocal];
            NSString *visita = [NSString stringWithFormat: @"%d", (int)_datosPartido.idVisita];
            
            if([local isEqualToString:incidencia.teamId]){
                
                incidencia.key = _datosPartido.keyLocal;
                
            }else if([visita isEqualToString:incidencia.teamId]){
                
                incidencia.key = _datosPartido.keyVisita;
                
            }
            incidencia.idIncidencia = [[i objectForKey:@"id"] integerValue];
            incidencia.jugador = [i objectForKey:@"jugador"];
            incidencia.parte = [i objectForKey:@"parte"];
            
            
            incidencia.minuto = [[i objectForKey:@"minuto"] integerValue];
            incidencia.orden = [[i objectForKey:@"orden"] integerValue];
            incidencia.tiempo = [i objectForKey:@"tiempo"];
            incidencia.imagenVideo = [i objectForKey:@"image"];
            incidencia.video = [i objectForKey:@"video"];
            incidencia.tipo = [i objectForKey:@"tipo"];
            incidencia.jugadorentra = [i objectForKey:@"entra"];
            incidencia.jugadorsale = [i objectForKey:@"sale"];
            incidencia.partialScore =[i objectForKey:@"partial_score"];
            if([[i objectForKey:@"id"] integerValue]==7){
                incidencia.teamId = [i objectForKey:@"teamId"];
                Incidencia *incidencia2 = [[Incidencia alloc] init] ;
                incidencia2.Incidencia = [[i objectForKey:@"incidencia"] integerValue];
                incidencia2.teamId = [i objectForKey:@"teamId"];
                incidencia2.imagenVideo = [i objectForKey:@"image"];
                incidencia.video = [i objectForKey:@"video"];
                incidencia2.idIncidencia = 6;
                incidencia2.jugador = [i objectForKey:@"jugador"];
                incidencia2.parte = [i objectForKey:@"parte"];
                incidencia.partialScore =[i objectForKey:@"partial_score"];
                if([local isEqualToString:incidencia2.teamId]){
                    
                    incidencia2.key = _datosPartido.keyLocal;
                    
                }else if([visita isEqualToString:incidencia2.teamId]){
                    
                    incidencia2.key = _datosPartido.keyVisita;
                    
                }
                incidencia2.minuto = [[i objectForKey:@"minuto"] integerValue];
                incidencia2.orden = [[i objectForKey:@"orden"] integerValue];
                incidencia2.tiempo = [i objectForKey:@"tiempo"];
                incidencia2.tipo = [i objectForKey:@"tipo"];
                incidencia2.jugadorentra = [i objectForKey:@"entra"];
                incidencia2.jugadorsale = [i objectForKey:@"sale"];
                [_incidencias addObject:incidencia2];
            }
            
            [_incidencias addObject:incidencia];
        }
        
        NSSortDescriptor* sortOrder = [NSSortDescriptor sortDescriptorWithKey: @"minuto" ascending: NO];
        NSArray *incidencias =  [_incidencias sortedArrayUsingDescriptors: [NSArray arrayWithObject: sortOrder]];
        
        _incidencias = [NSMutableArray arrayWithArray:incidencias];
        
        
        
        
  
        
     
               
        //if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        
        /*
         if(_datosPartido.golesLocal==_datosPartido.golesVisita){
         _fondoGol.backgroundColor = [UIColor colorWithRed:13.0f/255.0f green:86.0f/255.0f blue:121.0f/255.0f alpha:1.0];
         _fondoGol1.backgroundColor = [UIColor colorWithRed:13.0f/255.0f green:86.0f/255.0f blue:121.0f/255.0f alpha:1.0];
         _golesLocal.textColor = [UIColor whiteColor];
         _golesVisita.textColor = [UIColor whiteColor];
         }
         */
        //}
        
        
        
        
        //NSLog(@"KEYS %@ %@", _datosPartido.keyLocal, _datosPartido.keyVisita);
   
        
        
        
        if (!finalizado) {
            
            [self startRefresh];
        }
        
        completion(nil);
  
    }failure:^(NSError *error) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Servicio no disponible"
                                                        message:@"El servicio solicitado no se encuentra disponible en estos momentos. Inténtelo más tarde."
                                                       delegate:self
                                              cancelButtonTitle:@"Aceptar"
                                              otherButtonTitles:nil];
        
        [alert show];
        
     
        
    }];
    
}


-(void)startRefresh {
    
    if (finalizado) {
        return;
    }
    
    [timer invalidate];
    timer = nil;
    
    timer =[NSTimer scheduledTimerWithTimeInterval:60 target:self selector:@selector(loadIncidences) userInfo:nil repeats:YES];
    
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    
    
    
    [timer2 invalidate];
    timer2 = nil;
    
    timer2 =[NSTimer scheduledTimerWithTimeInterval:60 target:self selector:@selector(loadIncidencesGol) userInfo:nil repeats:YES];
    
    [[NSRunLoop currentRunLoop] addTimer:timer2 forMode:NSRunLoopCommonModes];
}
-(void)loadIncidencesGol{


}
-(void)loadIncidences {
    
    [timer invalidate];
    timer = nil;
    
    _incidencias = [[NSMutableArray alloc] init];
    
    _datosPartido=[Partido new];
    
    NSString * p = [NSString stringWithFormat:@"%d", 219168];
    [SBTVServices getWsUrl:@"datos_partido" params:p sucess:^(id responseObject) {
        
        NSLog(@"DATA REFRESH!!!!!!");
   
        Incidencia *inicio = [[Incidencia alloc] init];
        inicio.idIncidencia = 14;
        inicio.minuto = 0;
        [_incidencias addObject:inicio];
        Incidencia *fin = [[Incidencia alloc] init];
        fin.idIncidencia = 15;
        fin.minuto = 90;
        [_incidencias addObject:fin];
        
        
        if ([responseObject count] == 0) {
            return;
        }
        _datosPartido.keyLocal = [[responseObject objectAtIndex:0] objectForKey:@"keyLocal"];
        _datosPartido.keyVisita = [[responseObject objectAtIndex:0] objectForKey:@"keyVisita"];
        _datosPartido.escudoVisita =  [[responseObject objectAtIndex:0] objectForKey:@"escudoVisita"];
        _datosPartido.escudoLocal = [[responseObject objectAtIndex:0] objectForKey:@"escudoLocal"];
        _datosPartido.golesLocal = [[[responseObject objectAtIndex:0] objectForKey:@"golesLocal"] intValue];
        _datosPartido.golesVisita = [[[responseObject objectAtIndex:0] objectForKey:@"golesVisita"] intValue];
        _datosPartido.hora = [[responseObject objectAtIndex:0] objectForKey:@"hora"];
        _datosPartido.fecha = [[responseObject objectAtIndex:0] objectForKey:@"fecha"];
        _datosPartido.idLocal = [[[responseObject objectAtIndex:0] objectForKey:@"idLocal"] integerValue];
        _datosPartido.idVisita = [[[responseObject objectAtIndex:0] objectForKey:@"idVisita"] integerValue];
        _datosPartido.equipoLocal = [[responseObject objectAtIndex:0] objectForKey:@"nombreLocal"];
        _datosPartido.equipoVisita = [[responseObject objectAtIndex:0] objectForKey:@"nombreVisita"];
        
        
        for(NSDictionary *i in [[responseObject objectAtIndex:0] objectForKey:@"incidencia"]){
            
            Incidencia *incidencia = [[Incidencia alloc] init];
            incidencia.Incidencia = [[i objectForKey:@"incidencia"] integerValue];
            
            
            incidencia.teamId = [i objectForKey:@"teamId"];
            
            
            
            NSString *local = [NSString stringWithFormat: @"%d", (int)_datosPartido.idLocal];
            NSString *visita = [NSString stringWithFormat: @"%d", (int)_datosPartido.idVisita];
            
            if([local isEqualToString:incidencia.teamId]){
                
                incidencia.key = _datosPartido.keyLocal;
                
            }else if([visita isEqualToString:incidencia.teamId]){
                
                incidencia.key = _datosPartido.keyVisita;
                
            }
            incidencia.idIncidencia = [[i objectForKey:@"id"] integerValue];
            incidencia.jugador = [i objectForKey:@"jugador"];
            incidencia.parte = [i objectForKey:@"parte"];
            
            
            incidencia.minuto = [[i objectForKey:@"minuto"] integerValue];
            incidencia.orden = [[i objectForKey:@"orden"] integerValue];
            incidencia.tiempo = [i objectForKey:@"tiempo"];
            incidencia.imagenVideo = [i objectForKey:@"image"];
            incidencia.video = [i objectForKey:@"video"];
            incidencia.tipo = [i objectForKey:@"tipo"];
            incidencia.jugadorentra = [i objectForKey:@"entra"];
            incidencia.jugadorsale = [i objectForKey:@"sale"];
            
            if([[i objectForKey:@"id"] integerValue]==7){
                incidencia.teamId = [i objectForKey:@"teamId"];
                Incidencia *incidencia2 = [[Incidencia alloc] init];
                incidencia2.Incidencia = [[i objectForKey:@"incidencia"] integerValue];
                incidencia2.teamId = [i objectForKey:@"teamId"];
                incidencia2.idIncidencia = 6;
                incidencia2.jugador = [i objectForKey:@"jugador"];
                incidencia2.parte = [i objectForKey:@"parte"];
                if([local isEqualToString:incidencia2.teamId]){
                    
                    incidencia2.key = _datosPartido.keyLocal;
                    
                }else if([visita isEqualToString:incidencia2.teamId]){
                    
                    incidencia2.key = _datosPartido.keyVisita;
                    
                }
                incidencia2.minuto = [[i objectForKey:@"minuto"] integerValue];
                incidencia2.orden = [[i objectForKey:@"orden"] integerValue];
                incidencia2.tiempo = [i objectForKey:@"tiempo"];
                incidencia2.tipo = [i objectForKey:@"tipo"];
                incidencia2.jugadorentra = [i objectForKey:@"entra"];
                incidencia2.jugadorsale = [i objectForKey:@"sale"];
                incidencia2.imagenVideo = [i objectForKey:@"image"];
                incidencia2.video = [i objectForKey:@"video"];
                [_incidencias addObject:incidencia2];
            }
            
            [_incidencias addObject:incidencia];
            
            //[MBProgressHUD hideHUDForView:self.view animated:YES];
        }
        
        NSSortDescriptor* sortOrder = [NSSortDescriptor sortDescriptorWithKey: @"minuto" ascending: NO];
        NSArray *incidencias =  [_incidencias sortedArrayUsingDescriptors: [NSArray arrayWithObject: sortOrder]];
        
        _incidencias = [NSMutableArray arrayWithArray:incidencias];
        
        
     
        
        
        
        //NSLog(@"KEYS %@ %@", _datosPartido.keyLocal, _datosPartido.keyVisita);
        _incidenciasEncuentro.keyVisita = _datosPartido.keyVisita;
        _incidenciasEncuentro.keyLocal = _datosPartido.keyLocal;
        _incidenciasEncuentro.incidencias = _incidencias;
        [_incidenciasEncuentro cargarIncidencias];
        
        
        if (!finalizado) {
            [self startRefresh];
        }
        
    }failure:^(NSError *error) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Servicio no disponible"
                                                        message:@"El servicio solicitado no se encuentra disponible en estos momentos. Inténtelo más tarde."
                                                       delegate:self
                                              cancelButtonTitle:@"Aceptar"
                                              otherButtonTitles:nil];
        
        [alert show];
        
        
        
    }];
}


-(IBAction)ChatRoom:(id)sender{

    self.ChatRoomContainer.alpha=0.0f;
    self.ChatRoomContainer.hidden=YES;
    [UIView animateWithDuration:0.5 animations:^{
     
        self.hyperView.alpha=0.0f;
        self.ChatRoomContainer.alpha=1.0f;
        self.ChatRoomContainer.hidden=NO;
        
        
    } completion:^(BOOL finished) {
        
    }];
    
}
@end
