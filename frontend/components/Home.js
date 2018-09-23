import React from 'react';

import ons from 'onsenui';

import {
  Button,
  Page,
  Toolbar,
  ListItem,
  ListHeader
} from 'react-onsenui';

import PullToRefresh from './PullToRefresh';
import InfiniteScroll from './InfiniteScroll';
import SideMenu from './SideMenu';
import FloatingActionButton from './FloatingActionButton';
import SpeedDials from './SpeedDials';

const initialPlatform = ons.platform.isAndroid() ? 'android' : 'ios';

class Dashboard extends React.Component {
  gotoComponent(component, key) {
    this.props.navigator.pushPage({comp: component, props: { key }});
  }

  renderToolbar() {
    return (
      <Toolbar>
        <div className='center'>Dashboard</div>
      </Toolbar>
    );
  }

  render() {
    return (
      <Page renderToolbar={this.renderToolbar}>
<Button modifier="large--cta">
  Tap Me
</Button>

      </Page>
    );
  }
}

module.exports = Dashboard;
<Button modifier="large--cta">
  Tap Me
</Button>