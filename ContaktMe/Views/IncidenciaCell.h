//
//  IncidenciaCell.h
//  Copa Movistar Peru
//
//  Created by Juan Pablo Arias on 23-04-14.
//  Copyright (c) 2014 SmartboxTV. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IncidenciaCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *nombreEquipo;
@property (weak, nonatomic) IBOutlet UILabel *jugador;
@property (weak, nonatomic) IBOutlet UILabel *evento;
@property (weak, nonatomic) IBOutlet UILabel *minuto;
@property (weak, nonatomic) IBOutlet UIImageView *logoEquipo;
@property (weak, nonatomic) IBOutlet UIImageView *iconoIncidencia;
@property (weak, nonatomic) IBOutlet UIView *lineaTop;
@property (weak, nonatomic) IBOutlet UIView *lineaDown;
@property (weak, nonatomic) IBOutlet UILabel *indicadorTiempo;
@property (weak, nonatomic) IBOutlet UIView *marcadorTiempo;
@end
