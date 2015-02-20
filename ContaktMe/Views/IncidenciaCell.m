//
//  IncidenciaCell.m
//  Copa Movistar Peru
//
//  Created by Juan Pablo Arias on 23-04-14.
//  Copyright (c) 2014 SmartboxTV. All rights reserved.
//

#import "IncidenciaCell.h"


@implementation IncidenciaCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}
- (void)setBounds:(CGRect)bounds {
    [super setBounds:bounds];
    self.contentView.frame = bounds;
}
- (void)awakeFromNib
{


    _marcadorTiempo.layer.cornerRadius = 2;
    _marcadorTiempo.layer.masksToBounds = YES;
    // Initialization code
        if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
    _nombreEquipo.font = [UIFont fontWithName:FONT_LIGHT size:14];
    _jugador.font = [UIFont fontWithName:FONT_REGULAR size:16];
    _evento.font = [UIFont fontWithName:FONT_BOLD size:18];
    _minuto.font = [UIFont fontWithName:FONT_REGULAR size:12];
    _indicadorTiempo.font = [UIFont fontWithName:FONT_REGULAR size:16];

        }else{

            _nombreEquipo.font = [UIFont fontWithName:FONT_LIGHT size:12];
            _jugador.font = [UIFont fontWithName:FONT_REGULAR size:12];
            _evento.font = [UIFont fontWithName:FONT_BOLD size:14];
            _minuto.font = [UIFont fontWithName:FONT_REGULAR size:11];
            _indicadorTiempo.font = [UIFont fontWithName:FONT_REGULAR size:16];


        }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
