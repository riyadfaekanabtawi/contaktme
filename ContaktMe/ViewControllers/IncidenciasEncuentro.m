//
//  HomeViewController.m
//  ContaktMe
//
//  Created by Riyad Anabtawi on 1/11/15.
//  Copyright (c) 2015 Riyad Anabtawi. All rights reserved.
//

#import "IncidenciasEncuentro.h"
#import "IncidenciaCell.h"

#import "SBTVServices.h"
#import "Incidencia.h"
#import "UIImageView+WebCache.h"

@interface IncidenciasEncuentro ()

@end

@implementation IncidenciasEncuentro{

 NSTimer *timer;
}


@synthesize incidencias = _incidencias;

-(void)setIncidencias:(NSMutableArray *)incidencias {
    
    [incidencias sortUsingComparator:^NSComparisonResult(Incidencia *obj1, Incidencia *obj2) {
        
        if (obj1.idIncidencia == 1) {
            return NSOrderedDescending;
        }
        else if(obj1.idIncidencia == 2) {
            return NSOrderedAscending;
        }
        else if (obj2.idIncidencia == 1) {
            return NSOrderedAscending;
        }
        else if (obj2.idIncidencia == 2) {
            return NSOrderedDescending;
        }
        else if(obj2.orden > obj1.orden) {
            return NSOrderedDescending;
        }
        else if(obj2.orden < obj1.orden) {
            return NSOrderedAscending;
        }
        else {
            return NSOrderedSame;
        }
    }];
    
    _incidencias = incidencias;
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
       CALayer *layer  = self.footer.layer;
    layer.shadowOffset = CGSizeMake(1, 1);
    layer.shadowColor = [[UIColor blackColor] CGColor];
    layer.shadowRadius = 2.0f;
    layer.shadowOpacity = 0.25f;
    layer.shadowPath = [[UIBezierPath bezierPathWithRect:layer.bounds] CGPath];
    if (IsIphone5) {
        _heightTable.constant=350;

    }
    _tablaIncidencias.alpha = 0.0;
        _tablaIncidencias.scrollEnabled=YES;
    // Do any additional setup after loading the view.
    
    /*
    _incidencias = [NSMutableArray arrayWithObjects:
                    @{@"tipoEquipo":@"IncidenciaCellLocal"},
                    @{@"tipoEquipo":@"IncidenciaCellVisita"},
                    @{@"tipoEquipo":@"IncidenciaCellLocal"},
                    @{@"tipoEquipo":@"IncidenciaCellVisita"},
                    @{@"tipoEquipo":@"IncidenciaCellVisita"},
                    @{@"tipoEquipo":@"IncidenciaCellLocal"}
                    , nil];
    */
    
    //_tablaIncidencias = @{  }
//    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
//        _tituloSeccion.font = RobotoLight(22);
//    else
//        _tituloSeccion.font = RobotoLight(17);


   _refreshControl = [[UIRefreshControl alloc] init];
    [_refreshControl addTarget:self action:@selector(startRefresh:)
             forControlEvents:UIControlEventValueChanged];



    [self.tablaIncidencias addSubview:_refreshControl];
}

- (void)startRefresh:(UIRefreshControl *)sender
{
    _tablaIncidencias.scrollEnabled=NO;

[self.delegate cargarincidencias:self sucess:^(id responseObject) {

    [_tablaIncidencias reloadData];
   [_refreshControl endRefreshing];
        _tablaIncidencias.scrollEnabled=YES;
}


 ];}
- (void)cargarIncidencias{
    
    _loading.hidden = YES;
    [_tablaIncidencias reloadData];
    
    [UIView animateWithDuration:0.5 animations:^{
        _tablaIncidencias.alpha = 1.0;
    }];
    
}

+ (NSDictionary *)getIncidencia:(NSString *)name
{
    
    NSString *errorDesc = nil;
    NSPropertyListFormat format;
    NSString *plistPath;
    NSString *rootPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                              NSUserDomainMask, YES) objectAtIndex:0];
    plistPath = [rootPath stringByAppendingPathComponent:@"Incidencias.plist"];
    if (![[NSFileManager defaultManager] fileExistsAtPath:plistPath]) {
        plistPath = [[NSBundle mainBundle] pathForResource:@"Incidencias" ofType:@"plist"];
    }
    NSData *plistXML = [[NSFileManager defaultManager] contentsAtPath:plistPath];
    NSDictionary *temp = (NSDictionary *)[NSPropertyListSerialization
                                          propertyListFromData:plistXML
                                          mutabilityOption:NSPropertyListMutableContainersAndLeaves
                                          format:&format
                                          errorDescription:&errorDesc];
    if (!temp) {
        NSLog(@"Error reading plist: %@, format: %lu", errorDesc, format);
    }

    return [temp objectForKey:name];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)scrollViewDidScrollToTop:(UIScrollView *)scrollView {
    
    if ([self.delegate respondsToSelector:@selector(incidenciasEncuentroDidScrollToTop:)]) {
        [self.delegate incidenciasEncuentroDidScrollToTop:self];
    }
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView.contentOffset.y > 100) {
        if ([self.delegate respondsToSelector:@selector(incidenciasEncuentroDidScrollUp:)]) {
            [self.delegate incidenciasEncuentroDidScrollUp:self];
        }
    }
    else if(scrollView.contentOffset.y < 10) {
        if ([self.delegate respondsToSelector:@selector(incidenciasEncuentroDidScrollToTop:)]) {
            [self.delegate incidenciasEncuentroDidScrollToTop:self];
        }
    }
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}
-(BOOL)shouldAutorotate
{
    return YES;
}

-(NSUInteger)supportedInterfaceOrientations
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        return UIInterfaceOrientationMaskLandscape;
    }else{
        return UIInterfaceOrientationMaskPortrait;
        
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [_incidencias count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    Incidencia *datos = [_incidencias objectAtIndex:indexPath.row];
      if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
    if(datos.idIncidencia == 1 || datos.idIncidencia == 2) {
        return 75;
    }else  if(datos.idIncidencia == 14 || datos.idIncidencia == 15) {
        return 0;
    }

    else {
        return 100;
    }

      }else{
        if(datos.idIncidencia == 1 || datos.idIncidencia == 2) {
            return 0;
        }else  if(datos.idIncidencia == 14 || datos.idIncidencia == 15) {
            return 0;
        }

        else {
            return 85;
        }


    }
}

- (void)tableView:(UITableView *)tableView  willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [cell setBackgroundColor:[UIColor clearColor]];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Incidencia *datos = [_incidencias objectAtIndex:indexPath.row];
    
    NSString *tipo = @"";
    if([datos.key isEqualToString:_keyVisita]){
        tipo = @"IncidenciaCellVisita";
    }
    if([datos.key isEqualToString:_keyLocal]){
        tipo = @"IncidenciaCellLocal";
        
    }
    if(datos.idIncidencia == 1 || datos.idIncidencia == 2 || datos.idIncidencia == 17 || datos.idIncidencia == 18 || datos.idIncidencia == 49 || datos.idIncidencia == 50 || datos.idIncidencia == 51 || datos.idIncidencia == 52 || datos.idIncidencia == 53)
        tipo = @"IncidenciaIcono";
    if(datos.idIncidencia == 14 || datos.idIncidencia == 15){



        tipo = @"IncidenciaNull";


    }else{


        NSLog(@"Recuadacion y Espectadores no existen");
    }


    IncidenciaCell *cell = (IncidenciaCell *)[tableView
                                                dequeueReusableCellWithIdentifier:tipo];

    if(indexPath.row==0){
        cell.lineaTop.hidden = YES;
    }else{
        cell.lineaTop.hidden = NO;
    }
    
    if(indexPath.row==[_incidencias count]-1){
        cell.lineaDown.hidden = YES;
    }else{
        cell.lineaDown.hidden = NO;
    }
    
    
    if([tipo isEqualToString:@"IncidenciaIcono"]){
        
        NSDictionary *incidencia = [IncidenciasEncuentro getIncidencia:[NSString stringWithFormat:@"%ld", (long)datos.idIncidencia]];
        cell.iconoIncidencia.image = [UIImage imageNamed:[incidencia objectForKey:@"imagen"]];
         cell.evento.text = [incidencia objectForKey:@"value"];
        
    }else{


        if([datos.key isEqualToString:_keyVisita]){



           
            [cell.logoEquipo sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://s3-sa-east-1.amazonaws.com/cmpsbtv/cmp_shield/small/%ld.png",(long)_partido.idVisita]]
                                      completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                                          if (image) {
                                              
                                              cell.logoEquipo.image = image;
                                              cell.logoEquipo.image=nil;
                                              CGAffineTransform scale = CGAffineTransformMakeScale(1.1, 1.1);
                                              CGAffineTransform translate = CGAffineTransformMakeTranslation(0,0);
                                              cell.logoEquipo.transform =CGAffineTransformConcat(scale,translate);
                                              [UIView transitionWithView:cell.logoEquipo
                                                                duration:0.5f
                                                                 options:UIViewAnimationOptionTransitionCrossDissolve
                                                              animations:^{
                                                                  
                                                                  cell.logoEquipo.image = image;
                                                                  cell.logoEquipo.transform = CGAffineTransformIdentity;
                                                                  cell.logoEquipo.image = image;
                                                              } completion:nil];
                                          }

                                      }];
            
            
           
        }
        
        if([datos.key isEqualToString:_keyLocal]){


            [cell.logoEquipo sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://s3-sa-east-1.amazonaws.com/cmpsbtv/cmp_shield/small/%ld.png",(long)_partido.idLocal]]
                                      completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                                          if (image) {
                                              
                                              cell.logoEquipo.image = image;
                                              cell.logoEquipo.image=nil;
                                              CGAffineTransform scale = CGAffineTransformMakeScale(1.1, 1.1);
                                              CGAffineTransform translate = CGAffineTransformMakeTranslation(0,0);
                                              cell.logoEquipo.transform =CGAffineTransformConcat(scale,translate);
                                              [UIView transitionWithView:cell.logoEquipo
                                                                duration:0.5f
                                                                 options:UIViewAnimationOptionTransitionCrossDissolve
                                                              animations:^{
                                                                  
                                                                  cell.logoEquipo.image = image;
                                                                  cell.logoEquipo.transform = CGAffineTransformIdentity;
                                                                  cell.logoEquipo.image = image;
                                                              } completion:nil];
                                          }

                                      }];
            
            
           
        }
        
        if([datos.key isEqualToString:_keyVisita]) cell.nombreEquipo.text = _partido.equipoVisita;
        if([datos.key isEqualToString:_keyLocal]) cell.nombreEquipo.text = _partido.equipoLocal;
        
        cell.jugador.text = datos.jugador;
        
        cell.minuto.text = [NSString stringWithFormat:@"%ld'", (long)datos.minuto];
        
        NSDictionary *incidencia = [IncidenciasEncuentro getIncidencia:[NSString stringWithFormat:@"%ld", (long)datos.idIncidencia]];
        
        
        cell.evento.text = [incidencia objectForKey:@"value"];

        cell.iconoIncidencia.image = [UIImage imageNamed:[incidencia objectForKey:@"imagen"]];

        if([incidencia objectForKey:@"espectadores"] || ([incidencia objectForKey:@"recaudacion"] && [incidencia objectForKey:@"espectadores"]) || [incidencia objectForKey:@"recaudacion"] || datos.idIncidencia == 14 || datos.idIncidencia == 15){



            tipo = @"IncidenciaNull";


        }else{


           NSLog(@"Recuadacion y Espectadores no existen");
        }


        if([[incidencia objectForKey:@"value"] isEqualToString:@"Cambio entra"]){

            cell.jugador.text = datos.jugadorentra;

        }
        if([[incidencia objectForKey:@"value"] isEqualToString:@"Cambio sale"]){

            cell.jugador.text = datos.jugadorsale;

        }

        if ([datos.parte isEqualToString:@"1"]) {
            cell.indicadorTiempo.text = [NSString stringWithFormat:@"PT"];
        }
        else if ([datos.parte isEqualToString:@"2"]){
            cell.indicadorTiempo.text = @"ST";
        }else {
            cell.indicadorTiempo.text = @"";
        }
        
    }

    
    return cell;
    
    
    
}


@end
