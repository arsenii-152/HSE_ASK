import React, {useState} from 'react'

const LongTextQuestion = ({quizId}) => {
    const [value, setValue] = useState('')
    let data = {
        long_text_question: {
            body: value
        }
    }

    function sendQuestion() {
        const URL = `http://127.0.0.1:3000/api/v1/quizzes/${quizId}/long_text_questions/create`
        if (value) {
            fetch(URL, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(data)
            })
                .then((response) => response.json())
                .then((data) => console.log('Success:', data))
                .catch((error) => console.error('Error:', error))
        }
        window.location.reload()
    }

    return (
        <div>
            <textarea
                value={value}
                onChange={(e) => setValue(e.target.value)}
            />
            <button id={'sendQuestion'} onClick={() => sendQuestion()}>Добавить</button>
        </div>
    );
};
export default LongTextQuestion
