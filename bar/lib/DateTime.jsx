const style = {
  background: '#212C39',
  paddingLeft: 15,
  paddingRight: 15,
  display: 'inline-block',
};

const render = ({ output }) => {
  if (typeof output === 'undefined') return null;
  return (
    <div>
      <span style={style}> {output.date}</span>
      <span style={{ ...style, background: '#243140' }}> {output.time}</span>
    </div>
  );
};

export default render;
