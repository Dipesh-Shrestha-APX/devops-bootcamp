# S3 Versioning and LifeCycle Configuration

# **1) S3 Versioning**

1. You can enable versioning in the s3 bucket during it’s creation

1. e.g of multiple version of a single file
    
    ![version1.png](S3%20Versioning%20and%20LifeCycle%20Configuration/version1.png)
    
    ![version 2.png](S3%20Versioning%20and%20LifeCycle%20Configuration/version_2.png)
    

![version 3.png](S3%20Versioning%20and%20LifeCycle%20Configuration/version_3.png)

1. If you toggle on the version option you can see the version avaialble
    
    ![listing versions in bucket.png](S3%20Versioning%20and%20LifeCycle%20Configuration/listing_versions_in_bucket.png)
    
2. if you want to delete specific version toggle on the version option the choose your specific version and you can delete it 
    
    ![delete specific version.png](S3%20Versioning%20and%20LifeCycle%20Configuration/delete_specific_version.png)
    

but the option will be of permanently deleting since you can choose any version it has to be permanently deleted else the stack can be uneven 

![option to permanently delete specific version.png](S3%20Versioning%20and%20LifeCycle%20Configuration/option_to_permanently_delete_specific_version.png)

1. you can toggle off the version button and delete you can delete the object itself
    
    ![delete the object.png](S3%20Versioning%20and%20LifeCycle%20Configuration/delete_the_object.png)
    

but here you will get the option to delete rather than permanently delete 

![option to delete object.png](S3%20Versioning%20and%20LifeCycle%20Configuration/option_to_delete_object.png)

which will in turn add delete marker rather than removing the version object as we can see

![outcome of delete.png](S3%20Versioning%20and%20LifeCycle%20Configuration/outcome_of_delete.png)

1. Versioning once enable can only be suspended not deleted
    
    ![versioning enable to suspend .png](S3%20Versioning%20and%20LifeCycle%20Configuration/versioning_enable_to_suspend_.png)
    

And versioning can be done only on the bucket level not on the object level

1. The new file version will be labeled will null in version section when versioning is not present i.e suspend of didn’t exist in the first place
    
    ![options after delete in the version suspend.png](S3%20Versioning%20and%20LifeCycle%20Configuration/options_after_delete_in_the_version_suspend.png)
    
2. Delete the delete markers and your object could be seen again without the  version toggle on 
    
    ![deleting delete markers.png](S3%20Versioning%20and%20LifeCycle%20Configuration/deleting_delete_markers.png)
    
    ![deleting delete markers 2.png](S3%20Versioning%20and%20LifeCycle%20Configuration/deleting_delete_markers_2.png)
    

# **2) S3 Life cycle configuration**

1. The lifecycle configuration section is under the management tab inside your bucket
    
    ![life cycle configuration 1.png](S3%20Versioning%20and%20LifeCycle%20Configuration/life_cycle_configuration_1.png)
    
2. Your can configure folder or prefix level, tags based and object size based lifecycle configuration
    
    ![life cycle configuration 2 filter to delete.png](S3%20Versioning%20and%20LifeCycle%20Configuration/life_cycle_configuration_2_filter_to_delete.png)
    

These filters have higher prioirity than the deleting of noncurrent version and current versions option that we will uselater on 

1. We have Two types of actions available :
    
       a) transition 
    
       b) deletion /expiry
    
    ![life cycle configuration 3 actions.png](S3%20Versioning%20and%20LifeCycle%20Configuration/life_cycle_configuration_3_actions.png)
    
    1. transition
    
        
        ![storage class transition in s3 aws documentation.png](S3%20Versioning%20and%20LifeCycle%20Configuration/storage_class_transition_in_s3_aws_documentation.png)
        
        ![transistion 1 to IA.png](S3%20Versioning%20and%20LifeCycle%20Configuration/transistion_1_to_IA.png)
        
        ![transistion 2 to IA to one zone IA.png](S3%20Versioning%20and%20LifeCycle%20Configuration/transistion_2_to_IA_to_one_zone_IA.png)
        
    
    ![transistion 3 to one zone IA to .png](S3%20Versioning%20and%20LifeCycle%20Configuration/transistion_3_to_one_zone_IA_to_.png)
    
    Minimum day requirement is 30  days on the standard, IA, onezone IA and 90 on Glacier instant and flexible and 180 days on Glacier Deep before any action (i mean any even deletion not only transition has to wait for that ???????? i donot get this one perfectly  waiting on guidance This idea conflicts with my understanding of the deletion on days after object becomes non currrent)  
    
    ![transistion 4 min day requirement.png](S3%20Versioning%20and%20LifeCycle%20Configuration/transistion_4_min_day_requirement.png)
    
    The options to 
    
    ![transistion 5 basic configuration of life cycle.png](S3%20Versioning%20and%20LifeCycle%20Configuration/transistion_5_basic_configuration_of_life_cycle.png)
    
    b. deletion or expiry
    
    ![transistion 6 to delete old version to wait .png](S3%20Versioning%20and%20LifeCycle%20Configuration/transistion_6_to_delete_old_version_to_wait_.png)
    
    ![transistion 7 review like.png](S3%20Versioning%20and%20LifeCycle%20Configuration/transistion_7_review_like.png)