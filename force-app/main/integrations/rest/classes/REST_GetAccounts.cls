
@RestResource(UrlMapping='/GetAccounts')
global class REST_GetAccounts {
    @HttpGet
    global static List<Account> GetAccounts() {
        List<Account> accounts = [
            SELECT
                Id,
                Name
            FROM Account
            ORDER BY CreatedDate DESC
            LIMIT 3
        ];

        return accounts;
    }
}