import {Stack, StackProps, Tags} from 'aws-cdk-lib';
import {Construct} from 'constructs';
import * as ecr from 'aws-cdk-lib/aws-ecr';
import * as ecs from 'aws-cdk-lib/aws-ecs';

export class SimpleServiceStack extends Stack {
    constructor(scope: Construct, id: string, props?: StackProps) {
        super(scope, id, props);

        // const tag = this.node.tryGetContext('tag') ?? 'latest'
        const repository = new ecr.Repository(this, 'repository', {repositoryName: 'simple-service'})
        Tags.of(repository).add('owner', 'Manuel Christlieb')
        Tags.of(repository).add('description', 'ecs training')



    }
}
