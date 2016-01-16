//
//  ImagesTableViewController.m
//  Blocstagram
//
//  Created by Eric Beasley on 1/13/16.
//  Copyright © 2016 eric j beasley. All rights reserved.
//

#import "ImagesTableViewController.h"
#import "Media.h"
#import "User.h"
#import "Comment.h"
#import "DataSource.h"

@interface ImagesTableViewController ()

@end

@implementation ImagesTableViewController

- (id)initWithStyle:(UITableViewStyle)style {
   self = [super initWithStyle:style];
   if (self) {
       
   }
   
   return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
   [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"imageCell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
   
    return self.items.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"imageCell" forIndexPath:indexPath];
    
    // Configure the cell...
   static NSInteger imageViewTag = 1234;
   UIImageView *imageView = (UIImageView *)[cell.contentView viewWithTag:imageViewTag];
   
   if (!imageView) {
      //Cell doesn't have configured image view eyt
      imageView = [[UIImageView alloc] init];
      imageView.contentMode = UIViewContentModeScaleToFill;
      
      imageView.frame = cell.contentView.bounds;
      imageView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
      
      imageView.tag = imageViewTag;
      [cell.contentView addSubview:imageView];
      
   }
   
    Media *item = self.items[indexPath.row];
    imageView.image = item.image;
   
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    Media *item = self.items[indexPath.row];
    UIImage *image = item.image;
    
    return image.size.height / image.size.width * CGRectGetWidth(self.view.frame);
}

- (NSArray *)items {
    return [DataSource sharedInstance].mediaItems;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end