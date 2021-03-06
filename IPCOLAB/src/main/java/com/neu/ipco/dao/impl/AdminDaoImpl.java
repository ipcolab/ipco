/**
 * 
 */
package com.neu.ipco.dao.impl;

import java.util.Collections;
import java.util.List;
import java.util.Set;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.neu.ipco.dao.AdminDao;
import com.neu.ipco.entity.ActivityAnswer;
import com.neu.ipco.entity.ActivityOption;
import com.neu.ipco.entity.BasicInstanceUser;
import com.neu.ipco.entity.CustomizeInstanceUser;
import com.neu.ipco.entity.Diagnostic;
import com.neu.ipco.entity.DiagnosticCategory;
import com.neu.ipco.entity.InstanceModule;
import com.neu.ipco.entity.InstanceQuiz;
import com.neu.ipco.entity.InstanceTopic;
import com.neu.ipco.entity.Module;
import com.neu.ipco.entity.Option;
import com.neu.ipco.entity.Quiz;
import com.neu.ipco.entity.QuizAnswer;
import com.neu.ipco.entity.QuizOption;
import com.neu.ipco.entity.RelatedDiagnostic;
import com.neu.ipco.entity.Topic;
import com.neu.ipco.entity.User;
import com.neu.ipco.entity.UserRole;
import com.neu.ipco.exception.AdminException;
import com.neu.ipco.utility.AppConstants;

/**
 * @author Harsha
 *
 */
@Repository("adminDao")
@Transactional
public class AdminDaoImpl implements AdminDao {
	
	private Logger LOGGER = Logger.getLogger(AdminDaoImpl.class);
	
	@Autowired
	private HibernateTemplate template;

	/* (non-Javadoc)
	 * @see com.neu.ipco.dao.AdminDao#loadAllTopics()
	 */
	public List<Topic> loadAllTopics() throws AdminException {
		
		LOGGER.debug("AdminDaoImpl: loadAllTopics: Executing");
		return template.loadAll(Topic.class);
	}

	public Topic addNewTopic(Topic newTopic) throws AdminException {
		LOGGER.debug("AdminDaoImpl: addNewTopic: Start");
		int topicId = (Integer) template.save(newTopic);
		LOGGER.debug("AdminDaoImpl: addNewTopic: Executing");
		return template.get(Topic.class, topicId);
	}

	public Topic getTopicById(int topicId) throws AdminException {
		LOGGER.debug("AdminDaoImpl: getTopicById: Executing");
		return template.get(Topic.class, topicId);
	}

	public void updateTopic(Topic topic) throws AdminException {
		LOGGER.debug("AdminDaoImpl: updateTopic: Executing");
		template.update(topic);
	}

	public void deleteTopic(Topic topic) throws AdminException {
		LOGGER.debug("AdminDaoImpl: deleteTopic: Executing");
		template.delete(topic);
	}

	public Module addNewModule(Module module) throws AdminException {
		LOGGER.debug("AdminDaoImpl: addNewModule: Start");
		int moduleId = (Integer) template.save(module);
		LOGGER.debug("AdminDaoImpl: addNewModule: Executing");
		return template.get(Module.class, moduleId);
	}

	public Module getModuleById(int moduleId) throws AdminException {
		LOGGER.debug("AdminDaoImpl: getModuleById: Executing");
		return template.get(Module.class, moduleId);
	}

	public void updateModule(Module module) throws AdminException {
		LOGGER.debug("AdminDaoImpl: getModuleById: Executing");
		template.update(module);
	}

	public void deleteModule(Module module) throws AdminException {
		LOGGER.debug("AdminDaoImpl: deleteModule: Executing");
		template.delete(module);
	}

	public ActivityOption addNewActivity(ActivityOption activityOption) throws AdminException {
		LOGGER.debug("AdminDaoImpl: addNewActivity: Start");
		int activityOptionId = (Integer) template.save(activityOption);
		LOGGER.debug("AdminDaoImpl: addNewActivity: Executing");
		return template.get(ActivityOption.class, activityOptionId);
	}

	public int getActivityOptionNextOrderNo(Integer moduleId) throws AdminException {
		LOGGER.debug("AdminDaoImpl: getActivityOptionNextOrderNo: Executing");
		List<ActivityOption> activityOptions = (List<ActivityOption>) template.findByNamedParam("from ActivityOption ao where ao.module.moduleId = :moduleId", "moduleId", moduleId);
		if(activityOptions.isEmpty()){
			return 1;
		}else{
			Collections.sort(activityOptions);
			return activityOptions.get(activityOptions.size()-1).getOrderNo()+1;
		}
	}

	public int getModuleNextOrderNo(Integer topicId) throws AdminException {
		LOGGER.debug("AdminDaoImpl: getModuleNextOrderNo: Executing");
		List<Module> modules = (List<Module>) template.findByNamedParam("from Module m where m.topic.topicId = :topicId", "topicId", topicId);
		if(modules.isEmpty()){
			return 1;
		}else{
			Collections.sort(modules);
			return modules.get(modules.size()-1).getOrderNo()+1;
		}
	}

	public int getTopicNextOrderNo(int topicTypeId) throws AdminException {
		LOGGER.debug("AdminDaoImpl: getTopicNextOrderNo: Executing");
		List<Topic> topics = (List<Topic>) template.findByNamedParam("from Topic t where t.topicType.typeId = :topicTypeId", "topicTypeId", topicTypeId);
		if(topics.isEmpty()){
			return 1;
		}else{
			Collections.sort(topics);
			return topics.get(topics.size()-1).getOrderNo()+1;
		}
	}

	public ActivityOption getActivityOptionById(int activityOptionId) throws AdminException {
		LOGGER.debug("AdminDaoImpl: getActivityOptionById: Executing");
		return template.get(ActivityOption.class, activityOptionId);
	}

	public void deleteActivityOption(ActivityOption activityOption) throws AdminException {
		LOGGER.debug("AdminDaoImpl: deleteActivityOption: Executing");
		template.delete(activityOption);
	}

	public List<ActivityOption> getActivitiesByModuleId(Integer moduleId) throws AdminException {
		LOGGER.debug("AdminDaoImpl: getActivitiesByModuleId: Executing");
		List<ActivityOption> activityOptions = (List<ActivityOption>) template.findByNamedParam("from ActivityOption ao where ao.module.moduleId = :moduleId", "moduleId", moduleId);
		Collections.sort(activityOptions);
		return activityOptions;
	}

	public void updateActivityOption(ActivityOption activityOption) throws AdminException {
		LOGGER.debug("AdminDaoImpl: updateActivityOption: Executing");
		template.update(activityOption);
	}

	public List<Module> getModulesByTopicId(Integer topicId) throws AdminException {
		LOGGER.debug("AdminDaoImpl: getModulesByTopicId: Executing");
		List<Module> modules = (List<Module>) template.findByNamedParam("from Module m where m.topic.topicId = :topicId", "topicId", topicId);
		Collections.sort(modules);
		return modules;
	}

	public List<Topic> getTopicsByTypeId(Integer typeId) throws AdminException {
		LOGGER.debug("AdminDaoImpl: getTopicsByTypeId: Executing");
		List<Topic> topics = (List<Topic>) template.findByNamedParam("from Topic t where t.topicType.typeId = :typeId", "typeId", typeId);
		Collections.sort(topics);
		return topics;
	}

	public ActivityOption editActivity(ActivityOption activityOption) throws AdminException {
		LOGGER.debug("AdminDaoImpl: editActivity: Start");
		template.update(activityOption);
		LOGGER.debug("AdminDaoImpl: editActivity: Executing");
		return template.get(ActivityOption.class, activityOption.getActivityOptionId());
	}

	public void deleteOptions(Set<Option> options) throws AdminException {
		LOGGER.debug("AdminDaoImpl: deleteOptions: Executing");
		template.deleteAll(options);
	}

	public List<DiagnosticCategory> loadAllCategories() throws AdminException {
		
		LOGGER.debug("AdminDaoImpl: loadAllCategories: Executing");
		return template.loadAll(DiagnosticCategory.class);
	}

	public int getCategoryNextOrderNo() throws AdminException {
		LOGGER.debug("AdminDaoImpl: getCategoryNextOrderNo: Executing");
		List<DiagnosticCategory> categories = loadAllCategories();
		if(categories.isEmpty()){
			return 1;
		}else{
			Collections.sort(categories);
			return categories.get(categories.size()-1).getOrderNo()+1;
		}
	}

	public DiagnosticCategory addNewCategory(DiagnosticCategory newDiagnosticCategory) throws AdminException {
		LOGGER.debug("AdminDaoImpl: addNewCategory: Start");
		int categoryId = (Integer) template.save(newDiagnosticCategory);
		LOGGER.debug("AdminDaoImpl: addNewCategory: Executing");
		return getDiagnosticCategoryById(categoryId);
	}

	public DiagnosticCategory getDiagnosticCategoryById(int categoryId) throws AdminException {
		LOGGER.debug("AdminDaoImpl: getDiagnosticCategoryById: Executing");
		return template.get(DiagnosticCategory.class, categoryId);
	}

	public void deleteCategory(DiagnosticCategory diagnosticCategory) throws AdminException {
		LOGGER.debug("AdminDaoImpl: deleteCategory: Start");
		template.delete(diagnosticCategory);
		LOGGER.debug("AdminDaoImpl: deleteCategory: End");
	}

	public void updateCategory(DiagnosticCategory diagnosticCategory) throws AdminException {
		LOGGER.debug("AdminDaoImpl: updateCategory: Executing");
		template.update(diagnosticCategory);
	}

	public List<Topic> loadCustomTopics() throws AdminException {
		LOGGER.debug("AdminDaoImpl: loadCustomTopics: Executing");
		return (List<Topic>) template.findByNamedParam("from Topic t where t.topicType.typeId = :topicTypeId", "topicTypeId", AppConstants.TOPIC_TYPE_ID_CUSTOM);
	}

	public Diagnostic addNewDiagnostic(Diagnostic diagnostic) throws AdminException {
		LOGGER.debug("AdminDaoImpl: addNewDiagnostic: Start");
		int diagnosticId = (Integer) template.save(diagnostic);
		LOGGER.debug("AdminDaoImpl: addNewDiagnostic: Executing");
		return template.get(Diagnostic.class, diagnosticId);
	}

	public Diagnostic getDiagnosticById(int diagnosticId) throws AdminException {
		LOGGER.debug("AdminDaoImpl: getDiagnosticById: Executing");
		return template.get(Diagnostic.class, diagnosticId);
	}

	public List<Diagnostic> loadAllDiagnostics() throws AdminException {
		
		LOGGER.debug("AdminDaoImpl: loadAllDiagnostics: Executing");
		return template.loadAll(Diagnostic.class);
	}

	public RelatedDiagnostic addRelatedDiagnostic(RelatedDiagnostic relatedDiagnostic) throws AdminException {
		LOGGER.debug("AdminDaoImpl: addRelatedDiagnostic: Start");
		int relatedDiagnosticId = (Integer) template.save(relatedDiagnostic);
		LOGGER.debug("AdminDaoImpl: addRelatedDiagnostic: Executing");
		return template.get(RelatedDiagnostic.class, relatedDiagnosticId);
	}

	public List<RelatedDiagnostic> loadAllRelatedDiagnostics() throws AdminException {
		
		LOGGER.debug("AdminDaoImpl: loadAllRelatedDiagnostics: Executing");
		return template.loadAll(RelatedDiagnostic.class);
	}

	public RelatedDiagnostic getRelatedDiagnosticById(int relatedDiagnosticId) throws AdminException {
		LOGGER.debug("AdminDaoImpl: getRelatedDiagnosticById: Executing");
		return template.get(RelatedDiagnostic.class, relatedDiagnosticId);
	}

	public RelatedDiagnostic saveOrUpdateRelatedDiagnostic(RelatedDiagnostic relatedDiagnostic) throws AdminException {
		LOGGER.debug("AdminDaoImpl: saveOrUpdateRelatedDiagnostic: Executing");
		template.saveOrUpdate(relatedDiagnostic);
		return template.get(RelatedDiagnostic.class, relatedDiagnostic.getRelatedDiagnosticId());
	}

	public void saveOrUpdateTopic(Topic topic) throws AdminException {
		LOGGER.debug("AdminDaoImpl: saveOrUpdateTopic: Executing");
		template.saveOrUpdate(topic);
	}

	public void saveQuiz(Quiz quiz) throws AdminException {
		LOGGER.debug("AdminDaoImpl: saveQuiz: Executing");
		template.save(quiz);
	}

	public Quiz getQuizById(int quizId) throws AdminException {
		LOGGER.debug("AdminDaoImpl: saveQuiz: Executing");
		return template.get(Quiz.class, quizId);
	}

	public void saveOrUpdateQuiz(Quiz quiz) throws AdminException {
		LOGGER.debug("AdminDaoImpl: saveOrUpdateQuiz: Executing");
		template.saveOrUpdate(quiz);
	}

	public void deleteDiagnostic(Diagnostic diagnostic) throws AdminException {
		LOGGER.debug("AdminDaoImpl: deleteDiagnostic: Executing");
		template.delete(diagnostic);
	}

	public void deleteRelatedDiagnostic(RelatedDiagnostic relatedDiagnostic) throws AdminException {
		LOGGER.debug("AdminDaoImpl: deleteRelatedDiagnostic: Executing");
		template.delete(relatedDiagnostic);
	}

	public void deleteRelatedDiagnostics(Set<RelatedDiagnostic> relatedDiagnostics) throws AdminException {
		LOGGER.debug("AdminDaoImpl: deleteRelatedDiagnostics: Executing");
		template.deleteAll(relatedDiagnostics);
	}

	public void deleteInstanceTopic(InstanceTopic instanceTopic) throws AdminException {
		LOGGER.debug("AdminDaoImpl: deleteInstanceTopic: Executing");
		template.delete(instanceTopic);
	}

	public List<InstanceTopic> getInstanceTopicsByTopcId(int topicId) throws AdminException {
		LOGGER.debug("AdminDaoImpl: loadCustomTopics: Executing");
		return (List<InstanceTopic>) template.findByNamedParam("from InstanceTopic it where it.topic.topicId = :topicId", "topicId", topicId);
	}

	public void saveOrUpdateDiagnostic(Diagnostic diagnostic) throws AdminException {
		LOGGER.debug("AdminDaoImpl: saveOrUpdateDiagnostic: Executing");
		template.saveOrUpdate(diagnostic);
	}

	public List<InstanceModule> getInstanceModulesByModuleId(int moduleId) throws AdminException {
		LOGGER.debug("AdminDaoImpl: loadCustomTopics: Executing");
		return (List<InstanceModule>) template.findByNamedParam("from InstanceModule im where im.module.moduleId = :moduleId", "moduleId", moduleId);
	}

	public void deleteInstanceModule(InstanceModule instanceModule) throws AdminException {
		LOGGER.debug("AdminDaoImpl: deleteInstanceModule: Executing");
		template.delete(instanceModule);
	}

	public List<User> loadAllUsers() throws AdminException {
		
		LOGGER.debug("AdminDaoImpl: loadAllUsers: Executing");
		return (List<User>) template.findByNamedParam("from User user where user.userType.userTypeId = :userTypeId", "userTypeId", AppConstants.USER_TYPE_ID_USER);
		
	}

	public User getUserById(int userId) throws AdminException {
		LOGGER.debug("AdminDaoImpl: getUserById: Executing");
		return template.get(User.class, userId);
	}

	@Override
	public void deleteQuizById(int deletableId) throws AdminException {
		LOGGER.debug("AdminDaoImpl: deleteQuizById: Executing");
		Quiz quiz = template.get(Quiz.class, deletableId);
		template.delete(quiz);
	}

	@Override
	public List<InstanceQuiz> geInstanceQuizByQuizId(int quizId) throws AdminException {
		LOGGER.debug("AdminDaoImpl: geInstanceQuizByQuizId: Executing");
		return (List<InstanceQuiz>) template.findByNamedParam("from InstanceQuiz iq where iq.quiz.quizId = :quizId", "quizId", quizId);
	}

	@Override
	public void deleteInstanceQuizes(List<InstanceQuiz> instanceQuizes) throws AdminException {
		LOGGER.debug("AdminDaoImpl: deleteInstanceQuizes: Executing");
		template.deleteAll(instanceQuizes);
	}

	@Override
	public Topic geTopicByQuizId(int quizId) throws AdminException {
		LOGGER.debug("AdminDaoImpl: geTopicByQuizId: Executing");
		List<Topic> topics = (List<Topic>) template.findByNamedParam("from Topic t where t.quiz.quizId = :quizId", "quizId", quizId);
		if(topics.isEmpty()){
			return null;
		}else{
			return topics.get(0);
		}
	}

	@Override
	public InstanceTopic getInstanceTopicByInstanceQuizId(Integer instanceQuizId) throws AdminException {
		LOGGER.debug("AdminDaoImpl: getInstanceTopicByInstanceQuizId: Executing");
		List<InstanceTopic> instanceTopics = (List<InstanceTopic>) template.findByNamedParam("from InstanceTopic it where it.quiz.instanceQuizId = :instanceQuizId", "instanceQuizId", instanceQuizId);
		if(instanceTopics.isEmpty()){
			return null;
		}else{
			return instanceTopics.get(0);
		}
	}

	@Override
	public QuizOption getQuizOptionById(int quizOptionId) throws AdminException {
		LOGGER.debug("AdminDaoImpl: getQuizOptionById: Executing");
		return template.get(QuizOption.class, quizOptionId);
	}

	@Override
	public void saveOrUpdateQuizOption(QuizOption quizOption) throws AdminException {
		LOGGER.debug("AdminDaoImpl: saveOrUpdateQuizOption: Executing");
		template.saveOrUpdate(quizOption);
	}

	@Override
	public List<QuizAnswer> getQuizAnswersByQuizOptionId(int deletableId) throws AdminException {
		LOGGER.debug("AdminDaoImpl: getQuizAnswersByQuizOptionId: Executing");
		return (List<QuizAnswer>) template.findByNamedParam("from QuizAnswer qa where qa.quizOption.quizOptionId = :quizOptionId", "quizOptionId", deletableId);
	}

	@Override
	public void deleteQuizAnswer(QuizAnswer quizAnswer) throws AdminException {
		LOGGER.debug("AdminDaoImpl: deleteQuizAnswer: Executing");
		template.delete(quizAnswer);
	}

	@Override
	public void deleteQuizOption(QuizOption quizOption) throws AdminException {
		LOGGER.debug("AdminDaoImpl: deleteQuizOption: Executing");
		template.delete(quizOption);
	}

	@Override
	public List<QuizOption> getQuizOptionsByQuizId(int quizId) throws AdminException {
		LOGGER.debug("AdminDaoImpl: getQuizOptionsByQuizId: Executing");
		return (List<QuizOption>) template.findByNamedParam("from QuizOption qo where qo.quiz.quizId = :quizId", "quizId", quizId);
	}

	@Override
	public void deleteActivityAnswer(ActivityAnswer activityAnswer) throws AdminException {
		LOGGER.debug("AdminDaoImpl: deleteActivityAnswer: Executing");
		template.delete(activityAnswer);
	}

	@Override
	public List<ActivityAnswer> getActivityAnswersByActivityOptionId(int activityOptionId) throws AdminException {
		LOGGER.debug("AdminDaoImpl: getActivityAnswersByActivityOptionId: Executing");
		return (List<ActivityAnswer>) template.findByNamedParam("from ActivityAnswer aa where aa.activityOption.activityOptionId = :activityOptionId", "activityOptionId", activityOptionId);
	}

	@Override
	public void deleteBasicInstanceUser(BasicInstanceUser basicInstanceUser) throws AdminException {
		LOGGER.debug("AdminDaoImpl: deleteBasicInstanceUser: Executing");
		template.delete(basicInstanceUser);
	}

	@Override
	public void deleteCustomizeInstanceUser(CustomizeInstanceUser customizeInstanceUser) throws AdminException {
		LOGGER.debug("AdminDaoImpl: deleteCustomizeInstanceUser: Executing");
		template.delete(customizeInstanceUser);
	}

	@Override
	public void deleteUser(User deletableUser) throws AdminException {
		LOGGER.debug("AdminDaoImpl: deleteUser: Executing");
		template.delete(deletableUser);
	}

	@Override
	public List<UserRole> loadAllUserRoles() throws AdminException {
		LOGGER.debug("AdminDaoImpl: loadAllUserRoles: Executing");
		return template.loadAll(UserRole.class);
	}

	@Override
	public void saveOrUpdateUserRole(UserRole userRole) throws AdminException {
		LOGGER.debug("AdminDaoImpl: saveOrUpdateUserRole: Executing");
		template.saveOrUpdate(userRole);
	}

	@Override
	public UserRole geUserRoleById(int userRoleId) throws AdminException {
		LOGGER.debug("AdminDaoImpl: geUserRoleById: Executing");
		return template.get(UserRole.class, userRoleId);
	}

}
