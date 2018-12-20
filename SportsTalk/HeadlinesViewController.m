//
//  HeadlinesViewController.m
//  SportsTalk
//
//  Created by Edwin Gonzalez on 12/13/17.
//  Copyright © 2017 Edwin Gonzalez. All rights reserved.
//

#import "HeadlinesViewController.h"
#import "CustomHeadlineTableViewCell.h"
#import "HeadlineManager.h"


@interface HeadlinesViewController ()

@property int numberOfArticles;
@property HeadlineManager *headlines;

@end

@implementation HeadlinesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
     self.navigationController.navigationBar.backgroundColor= [UIColor grayColor];
    
   self.navigationItem.title =@"Sports Name: Headlines";
    
    
    self.navigationItem.hidesBackButton=YES;

    
//    
//    //Using url and API key to request access to data from API
//    NSURL *url= [NSURL URLWithString:@"https://newsapi.org/v2/top-headlines?sources=fox-sports&apiKey=56a25cec00474146879073161ff6bf23"];
//    NSURLRequest *request= [NSURLRequest requestWithURL:url];
//    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data,NSError *connectionError){
//        
//        //Check if data is retrieved and whether no error occurs
//        if (data.length>0 && connectionError==nil){
//            
//            //The information received from the API
//            NSDictionary *recievedData =[NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
//            
//            self.numberOfArticles= [[recievedData objectForKey:@"totalResults"] integerValue];
//            NSArray *news = [[NSArray alloc] initWithArray:[recievedData objectForKey:@"articles"]];
//            
//            
//        }
//    }];
//                 
}


-(void) loadData{
    
    [[[NSURLSession sharedSession] dataTaskWithURL:[NSURL URLWithString: @"https://newsapi.org/v2/top-headlines?sources=fox-sports&apiKey=56a25cec00474146879073161ff6bf23"] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSDictionary *recievedData= [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        
        NSLog(@"%@",recievedData);
        _headlines =[[HeadlineManager alloc]init];
        
        
        NSString *str= [recievedData valueForKey:@"totalResults"];
        [_headlines setNumberOfheadlines:str.intValue];
        

        NSArray *news=[[NSArray alloc] initWithArray:[recievedData objectForKey:@"articles"]];
        
    }]resume];
    
}

//Tell how many sections are in the 
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //Add the number of headlines to set the number of rows
  return 6;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CustomHeadlineTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    cell.titleLabel.text=@"Title";
    cell.descriptionLabel.text=@"Description. wfkjlaejhfhkshfhslkejlfhdjkfhdkhghkdhgkjfdhgjkhfdjhgkjdghkjsd.";
    
    
    return cell;
}


@end
