//
// Generated by JSON2Apex http://json2apex.herokuapp.com/
//

public class JiraIssue {

    public class Items {
        public String toString;
        public Object to;
        public String fromString;
        //public Object from;
        public String fieldtype;
        public String field;
    }

    public class User {
        public String self;
        public String name;
        public String emailAddress;
        public AvatarUrls avatarUrls;
        public String displayName;
        public String active;
    }

    public class Issue {
        public String expand;
        public String id;
        public String self;
        public String key;
        public Fields fields;
    }

    public class Changelog {
        public List<Items> items;
        public Integer id;
    }

    public class Fields {
        public String summary;
        public String created;
        public String description;
        public List<String> labels;
        public String priority;
    }

    public Integer id;
    public String timestamp;
    public Issue issue;
    public User user;
    public Changelog changelog;
    public Comment comment;
    public String webhookEvent;

    public class Comment {
        public String self;
        public String id;
        public Author author;
        public String body;
        public Author updateAuthor;
        public String created;
        public String updated;
    }

    public class Author {
        public String self;
        public String name;
        public String emailAddress;
        public AvatarUrls avatarUrls;
        public String displayName;
        public Boolean active;
    }

    public class AvatarUrls {
        //public String 16x16;
        //public String 48x48;
    }

    
    public static JiraIssue parse(String json) {
        return (JiraIssue) System.JSON.deserialize(json, JiraIssue.class);
    }
    
    static testMethod void testParse() {
        String json = '{ '+
        '    \"id\": 2,'+
        '    \"timestamp\": \"2009-09-09T00:08:36.796-0500\",'+
        '    \"issue\": { '+
        '        \"expand\":\"renderedFields,names,schema,transitions,operations,editmeta,changelog\",'+
        '        \"id\":\"99291\",'+
        '        \"self\":\"https://jira.atlassian.com/rest/api/2/issue/99291\",'+
        '        \"key\":\"JRA-20002\",'+
        '        \"fields\":{'+
        '            \"summary\":\"I feel the need for speed\",'+
        '            \"created\":\"2009-12-16T23:46:10.612-0600\",'+
        '            \"description\":\"Make the issue nav load 10x faster\",'+
        '            \"labels\":[\"UI\", \"dialogue\", \"move\"],'+
        '            \"priority\": \"Minor\"'+
        '        }'+
        '    },'+
        '    \"user\": {'+
        '        \"self\":\"https://jira.atlassian.com/rest/api/2/user?username=brollins\",'+
        '        \"name\":\"brollins\",'+
        '        \"emailAddress\":\"bryansemail at atlassian dot com\",'+
        '        \"avatarUrls\":{'+
        '            \"16x16\":\"https://jira.atlassian.com/secure/useravatar?size=small&avatarId=10605\",'+
        '            \"48x48\":\"https://jira.atlassian.com/secure/useravatar?avatarId=10605\"'+
        '        },'+
        '        \"displayName\":\"Bryan Rollins [Atlassian]\",'+
        '        \"active\" : \"true\"'+
        '    },'+
        '    \"changelog\": {'+
        '        \"items\": ['+
        '            {'+
        '                \"toString\": \"A new summary.\",'+
        '                \"to\": null,'+
        '                \"fromString\": \"What is going on here?????\",'+
        '                \"from\": null,'+
        '                \"fieldtype\": \"jira\",'+
        '                \"field\": \"summary\"'+
        '            },'+
        '            {'+
        '                \"toString\": \"New Feature\",'+
        '                \"to\": \"2\",'+
        '                \"fromString\": \"Improvement\",'+
        '                \"from\": \"4\",'+
        '                \"fieldtype\": \"jira\",'+
        '                \"field\": \"issuetype\"'+
        '            }'+
        '        ],'+
        '        \"id\": 10124'+
        '    },'+
        '    \"comment\" : {'+
        '        \"self\":\"https://jira.atlassian.com/rest/api/2/issue/10148/comment/252789\",'+
        '        \"id\":\"252789\",'+
        '        \"author\":{'+
        '            \"self\":\"https://jira.atlassian.com/rest/api/2/user?username=brollins\",'+
        '            \"name\":\"brollins\",'+
        '            \"emailAddress\":\"bryansemail@atlassian.com\",'+
        '            \"avatarUrls\":{'+
        '                \"16x16\":\"https://jira.atlassian.com/secure/useravatar?size=small&avatarId=10605\",'+
        '                \"48x48\":\"https://jira.atlassian.com/secure/useravatar?avatarId=10605\"'+
        '            },'+
        '            \"displayName\":\"Bryan Rollins [Atlassian]\",'+
        '            \"active\":true'+
        '        },'+
        '        \"body\":\"Just in time for AtlasCamp!\",'+
        '        \"updateAuthor\":{'+
        '            \"self\":\"https://jira.atlassian.com/rest/api/2/user?username=brollins\",'+
        '            \"name\":\"brollins\",'+
        '            \"emailAddress\":\"brollins@atlassian.com\",'+
        '            \"avatarUrls\":{'+
        '                \"16x16\":\"https://jira.atlassian.com/secure/useravatar?size=small&avatarId=10605\",'+
        '                \"48x48\":\"https://jira.atlassian.com/secure/useravatar?avatarId=10605\"'+
        '            },'+
        '            \"displayName\":\"Bryan Rollins [Atlassian]\",'+
        '            \"active\":true'+
        '        },'+
        '        \"created\":\"2011-06-07T10:31:26.805-0500\",'+
        '        \"updated\":\"2011-06-07T10:31:26.805-0500\"'+
        '    },  '+
        '    \"timestamp\": \"2011-06-07T10:31:26.805-0500\",'+
        '    \"webhookEvent\": \"jira:issue_updated\"'+
        '}';
        JiraIssue obj = parse(json);
        System.assert(obj != null);
    }
}