import styles from './styles.jsx';

const style = {
  background: '#161D26',
  paddingLeft: 15,
  paddingRight: 15,
  fontFamily: styles.solidFamily,
};

const render = ({ output }) => {
  if (typeof output === 'undefined') return null;
  if (output === 'missing value') output = 100;

  if (output == 0)
    return <div style={{ ...style, color: styles.colors.red }}></div>;
  return (
    <div style={style}>
      {output >= 50 ? '' : ''} {output}
    </div>
  );
};

export default render;
