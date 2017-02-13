package cn.mygenekey.base;

/**
 * Created by mh on 17-2-8.
 */

import java.lang.reflect.ParameterizedType;
import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.springframework.orm.hibernate3.HibernateTemplate;



/**
 *

 *
 * @param <T>
 */
public class BaseDaoImpl<T> implements BaseDao<T> {

	@Resource
	private HibernateTemplate hibernateTemplate;

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	private Class<T> clazz;

	@SuppressWarnings("unchecked")
	public BaseDaoImpl() {
		// 得到超类的泛型化方法
		ParameterizedType type = (ParameterizedType) this.getClass()
				.getGenericSuperclass();
		clazz = (Class<T>) type.getActualTypeArguments()[0];
	}

	/**
	 * 保存实体对象
	 */
	public Integer save(T model) {
		return (Integer) hibernateTemplate.save(model);
	}

	/**
	 * 更新实体
	 */
	public void update(T model) {
		hibernateTemplate.update(model);

	}

	/**
	 * 保存或更新对象
	 */
	public void saveOrUpdate(T model) {
		hibernateTemplate.saveOrUpdate(model);

	}
	//批量更新或保存
	public void saveOrUpdateAll(Collection<T> models){
		hibernateTemplate.saveOrUpdateAll(models);
	}
	/**
	 * 根据id获取实体
	 */
	public T getById(Integer id) {
		if (id == null) {
			return null;
		} else {
			return hibernateTemplate.get(clazz, id);
		}
	}

	/**
	 * 根据id数组获取集合
	 */
	@SuppressWarnings("unchecked")
	public List<T> getByIds(Integer[] ids) {
		if (ids == null || ids.length == 0) {
			return Collections.EMPTY_LIST;
		} else {
			return this.hibernateTemplate
					.getSessionFactory()
					.getCurrentSession()
					.createQuery(//
							"FROM " + clazz.getSimpleName()
									+ " WHERE id IN (:ids)")//
					.setParameterList("ids", ids)//
					.list();
		}
	}

	// 通过主键直接删除
	public void deleteById(Integer id) {
		hibernateTemplate.delete(getById(id));
	}

	// 通过实体类直接删除
	public void delete(T model) {
		hibernateTemplate.delete(model);
	}


}
