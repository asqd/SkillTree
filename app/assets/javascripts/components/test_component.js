import Search from 'react-search'
import ReactDOM from 'react-dom'
import React, { Component, PropTypes } from 'react'

export default class TestComponent extends Component {

  constructor (props) {
    super(props)
    this.state = { repos: [] }
  }

  HiItems(items) {
    console.log(items)
  }

  getItemsAsync(searchValue, cb) {
    let url = `/api/disciplines/?specialty_id=${searchValue}`
    fetch(url).then( (response) => {
      return response.json();
    }).then((results) => {
      if(results != undefined){
        let items = results.map( (res, i) => { return { id: i, value: res.name } })
        this.setState({ repos: items })
        cb(searchValue)
      }
    });
  }

  render () {
    return (
      <div className="card" type="">
        <Search items={this.state.repos}
                placeholder={"Поиск дисциплин"}
                multiple={true}
                maxSelected={2}
                getItemsAsync={this.getItemsAsync.bind(this)}
                onItemsChanged={this.HiItems.bind(this)} />
      </div>
    )
  }
}