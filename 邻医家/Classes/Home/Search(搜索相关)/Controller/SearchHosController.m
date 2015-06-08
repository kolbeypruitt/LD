//
//  SearchHosController.m
//  邻医家
//
//  Created by myApple on 15/5/5.
//  Copyright (c) 2015年 DanielGrason. All rights reserved.
//
#define ID @"cell"
#import "IWCommon.h"
#import "MoreHosController.h"
#import "ActionSheetCustomPicker.h"
#import "MoreCell.h"
#import "MoreItem.h"
#import "City.h"
#import "Province.h"
#import "MJExtension.h"
#import "AFNetworking.h"
#import "SearchHosController.h"
#import "MoreGroup.h"
#import "MoreHeader.h"
#import "HotArea.h"
#import "SearchHosResultController.h"
#import "DocSearchParam.h"
@interface SearchHosController () <UICollectionViewDelegateFlowLayout,UISearchBarDelegate,MoreCellDelegate,ActionSheetCustomPickerDelegate>
@property (nonatomic,copy) NSString *selectedProvince;
@property (nonatomic,copy) NSString *selectedCity;
@property (nonatomic,strong) NSArray *provinces;
@property (nonatomic,weak) UISearchBar *searchBar;
@end

@implementation SearchHosController
- (NSArray *)provinces
{
    if (_provinces == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"city.json" ofType:nil];
        NSData *data = [NSData dataWithContentsOfFile:path];
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        _provinces = [Province objectArrayWithKeyValuesArray:dict[@"provinces"]];
     
    }
    return _provinces;
}
- (NSMutableArray *)groups
{
    if (_groups == nil) {
        _groups = [NSMutableArray array];
    }
    return _groups;
}
- (MoreGroup *)addGroup
{
    MoreGroup *group = [MoreGroup group];
    [self.groups addObject:group];
    return group;
}
- (id)init
{
    // 1.流水布局
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.headerReferenceSize = CGSizeMake(100, 20);
    // 2.每个cell的尺寸
    layout.itemSize = CGSizeMake(80, 40);
    // 3.设置cell之间的水平间距
    layout.minimumInteritemSpacing = 0;
    // 4.设置cell之间的垂直间距
    layout.minimumLineSpacing = 10;
    // 5.设置四周的内边距
    layout.sectionInset = UIEdgeInsetsMake(layout.minimumLineSpacing, 0, 0, 0);
    return [super initWithCollectionViewLayout:layout];
}
- (void)setupGroup0
{
    MoreGroup *group = [self addGroup];
    group.header = @"医院等级";
    group.cellSize  = CGSizeMake(80, 40);
    MoreItem *item1 = [MoreItem itemWithTitle:@"公立三甲"];
    MoreItem *item2 = [MoreItem itemWithTitle:@"公立二甲"];
    MoreItem *item3 = [MoreItem itemWithTitle:@"公立一甲"];
    MoreItem *item4 = [MoreItem itemWithTitle:@"民营医院"];
    group.items = @[item1,item2,item3,item4];
}
- (void)setupGroup1
{
    MoreGroup *group = [self addGroup];
    group.header = @"热门城市";
    group.cellSize = CGSizeMake(80, 40);
    MoreItem *item1 = [MoreItem itemWithTitle:@"北京"];
    item1.operation = ^{
        NSLog(@"here");
    };
    MoreItem *item2 = [MoreItem itemWithTitle:@"上海"];
    MoreItem *item3 = [MoreItem itemWithTitle:@"天津"];
    MoreItem *item4 = [MoreItem itemWithTitle:@"成都"];
    MoreItem *item5 = [MoreItem itemWithTitle:@"广州"];
    MoreItem *item6 = [MoreItem itemWithTitle:@"南京"];
    item6.destClass = [MoreHosController class];
    MoreItem *item7 = [MoreItem itemWithTitle:@"更多城市"];
    group.items = @[item1,item2,item3,item4,item5,item6,item7];
}
- (void)setupGroup2
{
    MoreGroup *group = [self addGroup];
    group.header = @"热门医院";
    group.cellSize = CGSizeMake(120,44);
    MoreItem *item1 = [MoreItem itemWithTitle:@"湘雅医院"];
    MoreItem *item2 = [MoreItem itemWithTitle:@"上海华山医院"];
    MoreItem *item3 = [MoreItem itemWithTitle:@"北京协和医院附属医院"];
    MoreItem *item4 = [MoreItem itemWithTitle:@"上海同仁医院"];
    MoreItem *item5 = [MoreItem itemWithTitle:@"上海第二军医大学"];
    MoreItem *item6 = [MoreItem itemWithTitle:@"重庆第一人民医院"];
    MoreItem *item7 = [MoreItem itemWithTitle:@"解放军301医院"];
    group.items = @[item1,item2,item3,item4,item5,item6,item7];
}
- (void)setupGroup3
{
    MoreGroup *group = [self addGroup];
    group.cellSize = CGSizeMake(80, 40);
    group.header = @"热门科室";
    MoreItem *item1 = [MoreItem itemWithTitle:@"骨外科"];
    MoreItem *item2 = [MoreItem itemWithTitle:@"骨外科"];
    MoreItem *item3 = [MoreItem itemWithTitle:@"骨外科"];
    MoreItem *item4 = [MoreItem itemWithTitle:@"骨外科"];
    MoreItem *item5 = [MoreItem itemWithTitle:@"骨外科"];
    MoreItem *item6 = [MoreItem itemWithTitle:@"骨外科"];
    group.items = @[item1,item2,item3,item4,item5,item6];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = IWColor(226, 226, 226);
    self.title = @"搜索医院";
    self.collectionView.contentInset = UIEdgeInsetsMake(50, 0, 0, 0);
    
    
    [self.collectionView registerClass:[MoreCell class] forCellWithReuseIdentifier:ID];
    [self.collectionView registerClass:[MoreHeader class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    self.collectionView.backgroundColor = [UIColor colorWithRed:226/255.0 green:226/255.0 blue:226/255.0 alpha:1.0];
    
    [self setupGroup0];
    [self setupGroup1];
    [self setupGroup2];
    [self setupGroup3];
    
    [self setupSearchBar];
    [self setKeyBoard];
}

- (void)setKeyBoard
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
}
- (void)keyboardWillChangeFrame:(NSNotification *)notification
{
    NSLog(@"key");
}
- (void)setupSearchBar
{
    UISearchBar *searchBar =  [[UISearchBar alloc] initWithFrame:CGRectMake(0, 74, self.view.frame.size.width, 30)];
    searchBar.delegate = self;
    searchBar.placeholder = @"请输入搜索关键词";
    self.searchBar = searchBar;
    [self.view addSubview:searchBar];
}
#pragma mark - collection datasoure and delegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.groups.count;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    MoreGroup *group = self.groups[section];
    return group.items.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MoreGroup *group = self.groups[indexPath.section];
    MoreItem *item = group.items[indexPath.row];
    
    MoreCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    cell.delegate = self;
    cell.item = item;
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
//    MoreGroup *group = self.groups[indexPath.section];
//    MoreItem *item = group.items[indexPath.row];
//    [self.navigationController popToViewController:self.navigationController.viewControllers[0] animated:YES];
//    if (item.operation) {
//        item.operation();
//    }
//    if (item.destClass) {
//        UIViewController *destVc = [[item.destClass alloc] init];
//        [self.navigationController pushViewController:destVc animated:NO];
//    }
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if (kind == UICollectionElementKindSectionHeader) {
//        UICollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"header" forIndexPath:indexPath];
        MoreHeader *view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"header" forIndexPath:indexPath];
        MoreGroup *group = self.groups[indexPath.section];
        view.group = group;
        return view;
    }
    return nil;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MoreGroup *group = self.groups[indexPath.section];
    return group.cellSize;
}
#pragma mark searchBar Delegate Mehtod
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.searchBar resignFirstResponder];
}
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    searchBar.showsCancelButton = YES;
}
- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
    searchBar.showsCancelButton = NO;
    
}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
}
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    SearchHosResultController *resultVC = [[SearchHosResultController alloc] init];
    DocSearchParam *param = [DocSearchParam docSearchParamWithCities:nil department:nil docName:searchBar.text];
    
    resultVC.param = param;
    resultVC.title = @"搜索结果";
    [self.navigationController pushViewController:resultVC animated:NO];
    [searchBar resignFirstResponder];
}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    
}
#pragma mark - cell delegate
- (void)moreCell:(MoreCell *)cell didClickedBtn:(UIButton *)button
{
    NSLog(@"%@",button.currentTitle);
    if ([button.currentTitle isEqualToString:@"更多城市"]) {
        NSNumber *yass1 = @0;
        NSNumber *yass2 = @0;

        NSArray *initialSelections = @[yass1, yass2];
//        [ActionSheetCustomPicker showPickerWithTitle:@"选择城市" delegate:self showCancelButton:YES origin:button initialSelections:initialSelections];
        ActionSheetCustomPicker *picker = [[ActionSheetCustomPicker alloc] initWithTitle:@"选择城市" delegate:self showCancelButton:YES origin:button initialSelections:initialSelections];
        
        UIBarButtonItem *cancelBarItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:nil action:nil];
        UIBarButtonItem *doneBarItem = [[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStyleDone target:nil action:nil];
        
        [picker setCancelButton:cancelBarItem];
        [picker setDoneButton:doneBarItem];
        [picker showActionSheetPicker];
    }else
    {
        int count = (int)self.navigationController.viewControllers.count;
//        SearchHosResultController *resultVC = [[SearchHosResultController alloc] init];
//        DocSearchParam *param = [DocSearchParam docSearchParamWithCities:button.currentTitle department:nil docName:nil];
//        
//        resultVC.param = param;
//        resultVC.title = button.currentTitle;
//        
//        [self.navigationController pushViewController:resultVC animated:NO];
        [self.navigationController popToViewController:self.navigationController.viewControllers[count - 2] animated:YES];
    }
    
}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

#pragma mark - UIPickerViewDataSource Implementtation
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    NSInteger citiesCount = [self.provinces[[pickerView selectedRowInComponent:0]] cities].count;
    switch (component) {
        case 0:
            return self.provinces.count;
            break;
        case 1:
            return citiesCount;
        default:
            break;
    }
    return 0;
}
- (CGFloat )pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    switch (component) {
        case 0: return 160.0f;
        case 1: return 260.0f;
        default:break;
    }
    
    return 0;
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSArray *cities = [self.provinces[[pickerView selectedRowInComponent:0]] cities];
    switch (component) {
        case 0: return [self.provinces[row] name];
        case 1: return [cities[row] name];
        default:break;
    }
    return nil;
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSArray *cities = [self.provinces[[pickerView selectedRowInComponent:0]] cities];
    switch (component) {
        case 0:
            [pickerView reloadComponent:1];
            self.selectedProvince = [self.provinces[row] name];
            return;
            
        case 1:
            self.selectedCity = [cities[row] name];
            return;
        default:break;
    }
}

/////////////////////////////////////////////////////////////////////////
#pragma mark - ActionSheetCustomPickerDelegate Optional's 
/////////////////////////////////////////////////////////////////////////
- (void)configurePickerView:(UIPickerView *)pickerView
{
    // Override default and hide selection indicator
    pickerView.showsSelectionIndicator = NO;
}

- (void)actionSheetPickerDidSucceed:(AbstractActionSheetPicker *)actionSheetPicker origin:(id)origin
{
    NSString *resultMessage = [NSString stringWithFormat:@"%@ %@ selected.",
                                                         self.selectedProvince,
                                                         self.selectedCity];
    
    [[[UIAlertView alloc] initWithTitle:@"Success!" message:resultMessage delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil] show];
}
@end







