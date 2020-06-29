import styles from './styles.jsx';

const style = {
  background: '#4a4f5e',
  paddingLeft: 15,
  paddingRight: 15,
  fontFamily: styles.solidFamily,
};

const render = ({ output }) => {
  if (typeof output === 'undefined') return null;

  if (output == 0)
    return <div style={{ ...style, color: styles.colors.red }}></div>;
  return (
    <div style={style}>
      {output >= 50 ? '' : ''} {output}
    </div>
  );
};

export default render;
