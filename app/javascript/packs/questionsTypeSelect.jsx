import React, {useState} from 'react'
import ReactDOM from 'react-dom'
import LongTextQuestion from './longTextQuestion'
import ShortTextQuestion from "./shortTextQuestion";

const styles = {
    box: {
        margin: '20px'
    },
    select: {
        marginBottom: '20px'
    }
}

const QuestionsTypeSelect = () => {
    let quizID = document.getElementById('questionsTypeSelect').dataset.quizid
    const [value, setValue] = useState('')

    const selected = () => {
        if(value === '1') {
            return <LongTextQuestion quizId={quizID}/>
        } else if(value === '2') {
            return <ShortTextQuestion quizId={quizID}/>
        }
    }

    return (
        <div style={styles.box}>
            <select
                style={styles.select}
                value={value}
                onChange={(e) => setValue(e.target.value)}
            >
                <option disabled value="">Выбрать тип вопроса</option>
                <option key="1" value="1">long text</option>
                <option key="2" value="2">short text</option>
            </select>
            <div>
                {selected()}
            </div>
        </div>
    );
};

document.addEventListener('DOMContentLoaded', () => {
    ReactDOM.render(
        <QuestionsTypeSelect />,
        document.getElementById('questionsTypeSelect'),
    )
})
