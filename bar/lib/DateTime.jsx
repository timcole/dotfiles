const style = {
  background: '#383c4a',
  paddingLeft: 15,
  paddingRight: 15,
  display: 'inline-block',
};

const render = ({ output }) => {
  if (typeof output === 'undefined') return null;
  return (
    <div>
      <span style={style}> {output.date}</span>
      <span style={{ ...style, background: '#323642' }}> {output.time}</span>
    </div>
  );
};

export default render;
