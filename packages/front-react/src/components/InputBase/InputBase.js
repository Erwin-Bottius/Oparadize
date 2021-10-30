import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { PropTypes } from 'prop-types';
import style from './InputBase.scss';

const InputBase = ({
  icon, placeholder, inputName, handleOnChange, classCSS,
}) => (
  //
  <div className={`${style.userConnect__inputContainer} ${classCSS}`}>
    <div>
      <FontAwesomeIcon icon={icon} />
    </div>
    <input
      type="text"
      className={style.userConnect__input}
      placeholder={placeholder}
      name={inputName}
      onChange={handleOnChange}
    />
  </div>

);

InputBase.propTypes = {
  icon: PropTypes.string.isRequired,
  placeholder: PropTypes.string.isRequired,
  inputName: PropTypes.string.isRequired,
  handleOnChange: PropTypes.func.isRequired,
  classCSS: PropTypes.string.isRequired,
};

export default InputBase;