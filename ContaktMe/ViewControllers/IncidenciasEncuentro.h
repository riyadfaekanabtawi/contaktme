//
//  HomeViewController.m
//  ContaktMe
//
//  Created by Riyad Anabtawi on 1/11/15.
//  Copyright (c) 2015 Riyad Anabtawi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Partido.h"

#define   IsIphone5     ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )




@class IncidenciasEncuentro;

@protocol IncidenciasEncuentroDelegate <NSObject>



@end

@protocol IncidenciaDelegate <NSObject>



@optional

-(void)incidenciasEncuentroDidScrollToTop:(IncidenciasEncuentro *)incidenciasEncuentro;

-(void)cargarincidencias:(IncidenciasEncuentro *)incidenciasEncuentro sucess:(void (^) (id responseObject)) completion;

-(void)incidenciasEncuentroDidScrollUp:(IncidenciasEncuentro *)incidenciasEncuentro;

@end

@interface IncidenciasEncuentro : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic,retain) Partido *datosPartido;
@property (retain, nonatomic)    UIRefreshControl *refreshControl;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightTable;
@property (weak, nonatomic) IBOutlet UILabel *tituloSeccion;
@property (weak, nonatomic) IBOutlet UIView *footer;
@property (nonatomic,retain) NSMutableArray *incidencias;
@property NSDictionary *datosIncidencias;
@property NSString *keyLocal;
@property NSString *keyVisita;
@property NSString *nombreLocal;
@property NSString *nombreVisita;
@property Partido *partido;
@property (weak, nonatomic) IBOutlet UITableView *tablaIncidencias;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loading;
- (void)cargarIncidencias;
+ (NSDictionary *)getIncidencia:(NSString *)name;
@property (nonatomic, weak) id<IncidenciaDelegate> delegate;
@end

