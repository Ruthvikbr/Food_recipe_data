CREATE OR REPLACE FUNCTION check_user_exists(p_user_name VARCHAR) RETURNS INTEGER AS $$
DECLARE
    v_count INTEGER;
BEGIN
    -- Check if user exists
    SELECT COUNT(*)
    INTO v_count
    FROM users
    WHERE user_name = p_user_name;

    -- Return 1 if user exists, otherwise return 0
    IF v_count > 0 THEN
        RETURN 1;
    ELSE
        RETURN 0;
    END IF;
END;
$$ LANGUAGE plpgsql;

SELECT check_user_exists('username1');
SELECT check_user_exists('username100');
