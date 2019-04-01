#pragma mark - Existing Class Declarations

@interface IGExploreTopicSelectorViewController: UIViewController
@end

@interface IGExploreSingleTopicFeedViewController: UIViewController
@end

@interface IGExploreTopicalFeedViewController: UIViewController
- (void)searchTitleViewDidRequestSearchPresentation:(id)arg1;
@end

@interface IGNavigationBar: UINavigationBar 
@end

@interface IGNavSearchBar : UIView
@property(nonatomic) bool showsCancelButton;
@end

#pragma mark - Hooks

//Hide the Exploration Topic Selector
%hook IGExploreTopicSelectorViewController

- (void)viewDidLoad {
  self.view.hidden = true;
}

%end

// Hide The Exploration Feed
%hook IGExploreSingleTopicFeedViewController 

- (void)viewDidLoad {
  self.view.hidden = true;
}

%end

// Automatically display the search bar when the search controller appears
%hook IGExploreTopicalFeedViewController

- (void)viewDidAppear:(bool)animated {
  %orig;

  IGNavigationBar *bar = (IGNavigationBar *)MSHookIvar<id>(self, "_localNavigationBar");
  if (bar.items.count > 0) {
      UIView *titleView = bar.items[0].titleView;
      if (titleView.subviews.count > 0) {
          IGNavSearchBar *searchBar = titleView.subviews[0];
          [self searchTitleViewDidRequestSearchPresentation:searchBar];
      }
    }
}

%end

// Hide Cancel Button On Search Bar
%hook IGNavSearchBar

- (void)layoutSubviews {
  %orig;

  self.showsCancelButton = false;
}

%end
