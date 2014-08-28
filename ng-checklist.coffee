app = angular.module 'ng-checklist', []

app.directive 'ngChecklist', ->
  restrict: 'A',
  scope:
    header: '@'
    entries: '='
  templateUrl: 'ng-checklist.html',
  link: ($scope, $elem) ->
    checkedItemsCount = 0
    hidden = false
    rootEl = $($elem[0]).find('.checklist')
    uncheckAllBtn = rootEl.find('.fa-ban')
    showHideBtn = rootEl.find('.showhide')
    defaultHeight = rootEl.height()
    for entry in $scope.entries
      if entry.checked
        checkedItemsCount++
    $($elem[0]).find('.scrollable-content')
      .slimScroll(alwaysVisible: true, height: '100%')
    rootEl.resize ->
      if rootEl.height() == 32
        return if hidden
        hidden = true
        showHideBtn.removeClass('fa-chevron-circle-up')
        showHideBtn.addClass('fa-chevron-circle-down')
      else
        return if !hidden
        hidden = false
        showHideBtn.removeClass('fa-chevron-circle-down')
        showHideBtn.addClass('fa-chevron-circle-up')
    uncheckAllBtn.click -> $scope.$apply ->
      for entry in $scope.entries
        entry.checked = false
        checkedItemsCount = 0
        uncheckAllBtn.removeClass('enabled')
    showHideBtn.click ->
      listenToResize = false
      if !hidden
        rootEl.animate height: '32px',
          duration: 500
          complete: ->
            rootEl.css(height: '32px')
            hidden = true
        showHideBtn.removeClass('fa-chevron-circle-up')
        showHideBtn.addClass('fa-chevron-circle-down')
      else
        rootEl.animate height: defaultHeight+'px',
          duration: 500
          complete: ->
            rootEl.css(height: defaultHeight+'px')
            hidden = false
        showHideBtn.removeClass('fa-chevron-circle-down')
        showHideBtn.addClass('fa-chevron-circle-up')
    $scope.toggle = (entry) ->
      entry.checked = !entry.checked
      checkedItemsCount += entry.checked && 1 || -1
      if checkedItemsCount == 0
        uncheckAllBtn.removeClass('enabled')
      else
        uncheckAllBtn.addClass('enabled')
      return true

app.controller 'MainCtrl', ($scope) ->
  $scope.entries = [
    {
      "text": "Johnsonburg",
      "count": 21,
      "checked": false
    },
    {
      "text": "Genoa",
      "count": 17,
      "checked": false
    },
    {
      "text": "Ilchester",
      "count": 97,
      "checked": false
    },
    {
      "text": "Taycheedah",
      "count": 11,
      "checked": false
    },
    {
      "text": "Brule",
      "count": 71,
      "checked": false
    },
    {
      "text": "Sandston",
      "count": 53,
      "checked": false
    },
    {
      "text": "Shaft",
      "count": 72,
      "checked": false
    },
    {
      "text": "Felt",
      "count": 80,
      "checked": false
    },
    {
      "text": "Fairforest",
      "count": 38,
      "checked": false
    },
    {
      "text": "Kohatk",
      "count": 27,
      "checked": false
    },
    {
      "text": "Shepardsville",
      "count": 55,
      "checked": false
    },
    {
      "text": "Balm",
      "count": 79,
      "checked": false
    },
    {
      "text": "Ballico",
      "count": 23,
      "checked": false
    },
    {
      "text": "Sisquoc",
      "count": 54,
      "checked": false
    },
    {
      "text": "Crawfordsville",
      "count": 75,
      "checked": false
    },
    {
      "text": "Coinjock",
      "count": 17,
      "checked": false
    },
    {
      "text": "Breinigsville",
      "count": 13,
      "checked": false
    },
    {
      "text": "Riviera",
      "count": 95,
      "checked": false
    },
    {
      "text": "Sultana",
      "count": 63,
      "checked": false
    },
    {
      "text": "Websterville",
      "count": 60,
      "checked": false
    }
  ]