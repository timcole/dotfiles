import DateTime from './lib/DateTime.jsx';
import Battery from './lib/Battery.jsx';
import Wifi from './lib/Wifi.jsx';
import Volume from './lib/Volume.jsx';
import Error from './lib/Error.jsx';
import parse from './lib/parse.jsx';
import styles from './lib/styles.jsx';

const style = {
  display: 'grid',
  gridAutoFlow: 'column',
  position: 'fixed',
  overflow: 'hidden',
  right: '0px',
  top: '0px',
  verticalAlign: 'center',
  color: styles.colors.dim,
  fontFamily: styles.fontFamily,
  fontSize: styles.fontSize,
  lineHeight: styles.lineHeight,
  fontWeight: styles.fontWeight,
};

export const refreshFrequency = 1000;

export const command = './bar/scripts/status.sh';

export const render = ({ output }) => {
  const data = parse(output);

  if (typeof data === 'undefined')
    return (
      <div style={style}>
        <Error msg="Error: unknown script output" side="right" />
      </div>
    );

  return (
    <div style={style}>
      <Battery output={data.battery} />
      <Volume output={data.volume} />
      <Wifi output={{ ...data.wifi, lan: data.lan }} />
      <DateTime output={data.datetime} />
    </div>
  );
};

export default null;
