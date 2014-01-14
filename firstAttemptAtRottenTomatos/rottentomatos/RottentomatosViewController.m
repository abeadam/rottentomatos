//
//  RottentomatosViewController.m
//  rottentomatos
//
//  Created by Abraham Adam on 1/12/14.
//  Copyright (c) 2014 Abraham Adam. All rights reserved.
//

#import "RottentomatosViewController.h"

@interface RottentomatosViewController ()
-(void) loadInformation;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@end

@implementation RottentomatosViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Box Office";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.scrollView setDelegate:self];
    [self.scrollView setScrollEnabled:YES];
    [self loadInformation ];
    /*UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 50, 50)];
    title.font =[UIFont systemFontOfSize:30];
    title.text = @"test";
    [self.scrollView addSubview: title];
    [super viewDidLoad];
    [self loadInformation ];
    ;
    UILabel *newtitle = [[UILabel alloc] initWithFrame:CGRectMake(title.frame.origin.x, title.frame.origin.y+ title.frame.size.height, 200, 10)];
    newtitle.font =[UIFont systemFontOfSize:10];
    newtitle.lineBreakMode = NSLineBreakByCharWrapping;
    newtitle.numberOfLines = 0;
    newtitle.text = @"test";
    [self.scrollView addSubview: newtitle];
    UIView *view = [[UILabel alloc] initWithFrame:CGRectMake(10, newtitle.frame.size.height+newtitle.frame.origin.y, 300, 2)];
    view.backgroundColor = [UIColor blackColor];
    [self.scrollView addSubview:view];*/
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadInformation {
    NSString *url = @"http://api.rottentomatoes.com/api/public/v1.0/lists/dvds/top_rentals.json?apikey=g9au4hv6khv6wzvzgt55gpqs";
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        id object = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        //NSLog(@"%@", object);
        NSArray * movies = [object valueForKey:@"movies"];
        int x = 10;
        int y = 10;
        int titleHeight = 30;
        int width = 300;
        int descriptionHeight = 10;
        int lineHeight = 2;
        for (NSDictionary *movie in movies){
            //NSLog(@"%@", movie);
            /*NSArray * cast = [movie valueForKey:@"abridged_cast"];
             for (NSDictionary * character in cast) {
             NSArray * chars = [character valueForKey:@"characters"];
             NSString * firstCharacter = [chars objectAtIndex:0];
             NSString * name = [character valueForKey:@"name"];
             NSLog(@"%@ %@", firstCharacter, name);
             }
             NSString * consensus = [movie valueForKey:@"critics_consensus"];*/
            NSString * synopsis = [movie valueForKey:@"synopsis"];
            NSString * title = [movie valueForKey:@"title"];
            UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(x, y+5, width, titleHeight)];
            titleLabel.font = [UIFont systemFontOfSize:30];
            //titleLabel.lineBreakMode = NSLineBreakByCharWrapping;
            //titleLabel.numberOfLines = 0;
            titleLabel.text = title;
            [self.scrollView addSubview:titleLabel];
            y = titleLabel.frame.origin.y + titleLabel.frame.size.height;
            UILabel * descriptionLabel = [[UILabel alloc] init];
            descriptionLabel.font = [UIFont systemFontOfSize:10];
            descriptionLabel.lineBreakMode = NSLineBreakByWordWrapping;
            descriptionLabel.numberOfLines = 0;
            descriptionLabel.text = synopsis;
            CGSize labelSize = [descriptionLabel.text sizeWithFont:descriptionLabel.font constrainedToSize:CGSizeMake(width, 300) lineBreakMode:NSLineBreakByWordWrapping];
            [descriptionLabel setFrame:CGRectMake(x, y, width, labelSize.height+5)];
            [self.scrollView addSubview:descriptionLabel];
            y = descriptionLabel.frame.origin.y + descriptionLabel.frame.size.height;
            UIView *view = [[UILabel alloc] initWithFrame:CGRectMake(x, y, width, lineHeight)];
            view.backgroundColor = [UIColor blackColor];
            [self.scrollView addSubview:view];
            y = view.frame.origin.y + view.frame.size.height;
        
        //NSString * year = [movie valueForKey:@"year"];
        }
    }];
}

@end
