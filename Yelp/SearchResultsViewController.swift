//
//  SearchResultsViewController.swift
//  Yelp
//
//  Created by chengyin_liu on 5/23/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit

let BUSINESS_CELL_ID = "businessCell"

class SearchResultsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

  @IBOutlet weak var tableView: UITableView!

  var businesses: [Business]! = []

  override func viewDidLoad() {
    super.viewDidLoad()

    let businessCellNib = UINib.init(nibName: "BusinessTableViewCell", bundle: nil)
    tableView.registerNib(businessCellNib, forCellReuseIdentifier: BUSINESS_CELL_ID)

    tableView.estimatedRowHeight = 80
    tableView.rowHeight = UITableViewAutomaticDimension

    searchWithTerm("Thai")
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


  // MARK: - Data

  func searchWithTerm(term: String) {
    Business.searchWithTerm(term, completion: {
      (businesses: [Business]!, error: NSError!) -> Void in
      self.businesses = businesses
      self.tableView.reloadData()
    })
  }

  // MARK: - TableView

  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return businesses.count
  }

  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCellWithIdentifier(BUSINESS_CELL_ID, forIndexPath: indexPath) as? BusinessTableViewCell
      else { return UITableViewCell() }

    cell.showBusiness(self.businesses[indexPath.row])

    return cell
  }


  /*
   // MARK: - Navigation

   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
   // Get the new view controller using segue.destinationViewController.
   // Pass the selected object to the new view controller.
   }
   */

}
