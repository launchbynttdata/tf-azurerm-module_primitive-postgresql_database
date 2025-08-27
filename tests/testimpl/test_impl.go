package testimpl

import (
	"context"
	"log"
	"os"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/launchbynttdata/lcaf-component-terratest/types"
	"github.com/stretchr/testify/assert"

	"github.com/Azure/azure-sdk-for-go/sdk/azidentity"
	"github.com/Azure/azure-sdk-for-go/sdk/resourcemanager/postgresql/armpostgresqlflexibleservers/v2"
)

func TestComposableComplete(t *testing.T, ctx types.TestContext) {
	subscriptionId := os.Getenv("ARM_SUBSCRIPTION_ID")

	if len(subscriptionId) == 0 {
		t.Fatal("ARM_SUBSCRIPTION_ID environment variable is not set")
	}

	cred, err := azidentity.NewDefaultAzureCredential(nil)
	if err != nil {
		log.Fatalf("failed to obtain a credential: %v", err)
	}

	databaseClient, err := armpostgresqlflexibleservers.NewDatabasesClient(subscriptionId, cred, nil)
	if err != nil {
		log.Fatalf("failed to create database client: %v", err)
	}

	rgName := terraform.Output(t, ctx.TerratestTerraformOptions(), "resource_group_name")
	serverName := terraform.Output(t, ctx.TerratestTerraformOptions(), "server_name")
	databaseName := terraform.Output(t, ctx.TerratestTerraformOptions(), "database_name")

	t.Run("DatabaseWasCreated", func(t *testing.T) {
		// Perform a lookup and verify that our postgres server was created
		_, err := databaseClient.Get(context.TODO(), rgName, serverName, databaseName, nil)
		if err != nil {
			t.Fatalf("failed to get database: %v", err)
		}
		assert.NoError(t, err, "PostgreSQL Database should exist")
	})
}
