var express = require('express');
var router = express.Router();
var mysql = require('mysql');
var connection = mysql.createConnection({

    host: 'aws-rds-my-sql.czyy7a7mm4rr.us-west-2.rds.amazonaws.com',
    user: 'user',
    database: 'server',
    password: 'password'
});


router.get('/:board_idx', function(req, res, next) {
    connection.query('select * from board where board_idx=?;', [req.params.board_idx], function (error, cursor) {
        if (cursor.length > 0){
            res.json(cursor[0]);
        
        }
        
        
        else
            res.status(503).json({ result : false, reason : "글을 찾을 수 없습니다." });
    });
});



router.post('/', function(req, res, next) {
        var board_idx=req.board_idx;

         connection.query('update boardLike set boardLike_count= boardLike_count + 1 where board_idx=? ;', [req.body.board_idx], function (error, info) {
        if (error == null) {
            connection.query('select * from board where board_idx=?;', [req.body.board_idx], function (error, cursor) {
                if (cursor.length > 0) {
                    res.json({
                        result : true,
                        
                   board_title : cursor[0].board_title,
                   board_contents : cursor[0].board_contents,
                   board_like_count : cursor[0].board_like_count,
                    });
                }
                else
                    res.status(503).json({ result : false, reason : "Cannot post article" });
            });
        }
        else
            res.status(503).json(error);
    });
});

module.exports = router;
