import styles from './styles.jsx';

const style = {
  background: '#404552',
  paddingLeft: 15,
  paddingRight: 15,
};

let hover = false;
const render = ({ output }) => {
  if (typeof output === 'undefined') return null;
  const status = output.status;
  const ssid = output.ssid;
  const ip = output.ip;
  const lan = output.lan;

  if (lan !== '') return <div style={style}> {lan}</div>;
  if (status === 'inactive') return <div style={style}></div>;

  return (
    <div
      style={{ ...style, fontFamily: styles.solidFamily }}
      onClick={() => {
        hover = !hover;
      }}
    >
       {hover ? ssid : ip}
    </div>
  );
};

export default render;
