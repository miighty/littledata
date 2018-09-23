import React from 'react';

import ons from 'onsenui';

import {
  Page,
  Toolbar,
  List,
  ListHeader,
  ListItem,
  Switch,
  Input,
  Radio,
  Checkbox,
  Button,
  Range
} from 'react-onsenui';

class Forms extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      switchEnabled: true,
      vegetables: [
        100,
        1000,
        10000
      ],
      selectedVegetable: 'Cabbage',
      colors: [
        'London',
        'Manchester',
        'Bristol'
      ],
      name: 'Andreas'
    };
  }

  handleSwitchChange(event) {
    this.setState({
      switchEnabled: event.target.checked
    });
  }

  setVegetable(vegetable) {
    this.setState({
      selectedVegetable: vegetable
    });
  }

  handleNameChange(event) {
    this.setState({
      name: event.target.value
    });
  }

  renderToolbar() {
    return (
      <Toolbar>
        <div className='center'>Data of individuals</div>
      </Toolbar>
    );
  }

  render() {
    return (
      <Page renderToolbar={this.renderToolbar}>
        <List
          dataSource={[

            <ListItem key="range">
              <div className="center">Age</div>

              <div className="right">
                <Range modifier="material"
                       value={this.state.value}
                       onChange={(event) => this.setState({value1: parseInt(event.target.value)})}
                />

              </div>
            </ListItem>,


            <ListItem key="switch">
              <div className="center">
                Fit
              </div>
              <div className="right">
                <Switch
                  checked={this.state.switchEnabled}
                  onChange={this.handleSwitchChange.bind(this)}
                />
              </div>
            </ListItem>,
            <ListItem key="disabled-switch">
              <div className="center">
                Male
              </div>
              <div className="right">
                <Switch disabled />
              </div>
            </ListItem>
          ]}
          renderHeader={() => <ListHeader>Bio</ListHeader>}
          renderRow={(row) => row}
        />



        <List
          dataSource={this.state.colors}
          renderHeader={() => <ListHeader>cities</ListHeader>}
          renderRow={(color, index) => {
            return (
              <ListItem key={`color-${index}`} tappable>
                <label className="left">
                  <Checkbox inputId={'checkbox' + index} />
                </label>
                <label htmlFor={'checkbox' + index} className="center">
                  {color}
                </label>
              </ListItem>
            );
          }}
        />

        <List
          dataSource={this.state.vegetables}
          renderHeader={() => <ListHeader>Samples</ListHeader>}
          renderRow={(vegetable, index) => {
            return (
              <ListItem key={`vegetable-${index}`} tappable>
                <label className="left">
                  <Radio inputId={'radio' + index} name="vegetable" onChange={this.setVegetable.bind(this, vegetable)} checked={this.state.selectedVegetable === vegetable} />
                </label>
                <label htmlFor={'radio' + index} className="center">
                  {vegetable}
                </label>
              </ListItem>
            );
          }}
        />

        <div style={{}}>
          <Button modifier="large--cta">
            Buy
          </Button>
        </div>


      </Page>
    );
  }
}

module.exports = Forms;
