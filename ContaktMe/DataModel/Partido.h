//
//  Partido.h
//  Copa Movistar Peru
//
//  Created by Juan Pablo Arias on 22-04-14.
//  Copyright (c) 2014 SmartboxTV. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Partido : NSObject

@property NSInteger idPartido;
@property NSString *equipoLocal;
@property NSString *equipoVisita; 
@property NSString *estadio;
@property NSString *ciudad;
@property NSDate *date;
@property NSString *fecha;
@property NSString *estado;
@property NSString *liveVideo;
@property NSString *fechanum;
@property NSString *nombreFecha;
@property UIImage *logoLocal;
@property UIImage *logoVisita;
@property NSString *keyLocal;
@property NSString *keyVisita;
@property NSString *escudoVisita;
@property NSString *escudoLocal;
@property NSInteger idVisita;
@property NSInteger idLocal;
@property NSString *hora;
@property NSString *video;
@property NSString *imagen;
@property float minuto;
@property NSInteger golesLocal;
@property NSInteger golesVisita;
@property NSMutableArray *estadisticas;
@property NSMutableArray *incidencias;


@property NSString *minutosString;

@end
