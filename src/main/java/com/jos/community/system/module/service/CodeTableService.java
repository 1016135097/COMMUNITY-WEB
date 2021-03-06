package com.jos.community.system.module.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jos.community.system.module.controller.CodeTableCtrl;
import com.jos.community.system.module.entity.CodeTable;
import com.jos.community.system.module.model.CodeTableModel;
import com.jos.community.system.module.repository.CodeTableRepository;
import com.jos.community.system.module.vo.CodeTableGridRecordVo;
import com.jos.community.utils.Constant;
import com.jos.community.utils.DateUtils;
import com.jos.community.utils.DynamicSpecifications;
import com.jos.community.utils.SearchFilter;
import com.jos.community.utils.SearchFilter.Operator;
import com.jos.community.utils.StrUtils;
import com.jos.security.core.EntityUtils;

@Service
@Transactional(readOnly=true)
public class CodeTableService {

	protected static Logger logger = LoggerFactory.getLogger(CodeTableService.class);
	@Autowired
	private CodeTableRepository codeTableRepo;
	
	public Page<CodeTableGridRecordVo> search(Pageable pageable,CodeTableModel codeTableModel){
		Collection<SearchFilter> filters = null;
		Page<CodeTableGridRecordVo> page = null;
		Specification<CodeTable> spec = null;
		if (codeTableModel!=null) {
			filters =new ArrayList<SearchFilter>();
			SearchFilter filter = null;
			if (StrUtils.isNotBlank(codeTableModel.getCodeTableType())) {
				filter = new SearchFilter("type", Operator.EQ, codeTableModel.getCodeTableType());
				filters.add(filter);
			}
			if (StrUtils.isNotBlank(codeTableModel.getCode())) {
				filter = new SearchFilter("code", Operator.LIKE, codeTableModel.getCode());
				filters.add(filter);
			}
			if (StrUtils.isNotBlank(codeTableModel.getDescription())) {
				filter = new SearchFilter("description", Operator.LIKE, codeTableModel.getDescription());
				filters.add(filter);
			}
			spec = DynamicSpecifications.bySearchFilter(filters,CodeTable.class);
		}
		Page<CodeTable> result = this.codeTableRepo.findAll(spec, pageable);
		if (result!=null && result.getContent().size()>0) {
			List<CodeTable> resultList = result.getContent();
			List<CodeTableGridRecordVo> gridRecordVoList = new ArrayList<CodeTableGridRecordVo>();
			for(CodeTable codeTable : resultList){
				CodeTableGridRecordVo gridRecordVo = new CodeTableGridRecordVo();
				gridRecordVo.setCodeTableId(codeTable.getId());
				gridRecordVo.setCode(codeTable.getCode());
				gridRecordVo.setDescription(codeTable.getDescription());
				gridRecordVo.setModifiedDate(DateUtils.convertDateToStr(codeTable.getModifiedDate()));
				gridRecordVo.setType(codeTable.getType());
				gridRecordVoList.add(gridRecordVo);
			}
			page = new PageImpl<CodeTableGridRecordVo>(gridRecordVoList,pageable,result.getNumberOfElements());
		}else {
			page = new PageImpl<CodeTableGridRecordVo>(new ArrayList<CodeTableGridRecordVo>(), pageable, 0);
		}
		return page;
	}
	
	@Transactional(readOnly = false)
	public void save(CodeTableModel codeTableModel)throws Exception{
		CodeTable codeTable = null;
		if (StrUtils.isNotBlank(codeTableModel.getCodeTableId())) {
			codeTable = this.codeTableRepo.findOne(Integer.valueOf(codeTableModel.getCodeTableId()));
			EntityUtils.updateValue(codeTable);
		}else {
			codeTable = new CodeTable();
			EntityUtils.insertValue(codeTable);
		}
		codeTable.setType(codeTableModel.getCodeTableType());
		codeTable.setCode(codeTableModel.getCode());
		codeTable.setDescription(codeTableModel.getDescription());
		this.codeTableRepo.save(codeTable);
	}
	
	public CodeTableModel findById(String id)throws Exception{
		CodeTableModel codeTableModel = new CodeTableModel();
		if (StrUtils.isNotBlank(id)) {
			CodeTable codeTable = this.codeTableRepo.findOne(Integer.parseInt(id));
			if (codeTable!=null) {
				codeTableModel.setCodeTableId(id);
				codeTableModel.setCode(codeTable.getCode());
				codeTableModel.setCodeTableType(codeTable.getType());
				codeTableModel.setDescription(codeTable.getDescription());
			}
		}
		return codeTableModel;
	}
	
	@Transactional(readOnly = false)
	public void deleteByIds(String ids)throws Exception{
		if (StrUtils.isNotBlank(ids)) {
			String [] idArray = ids.split(",");
			for(String id : idArray){
				this.codeTableRepo.delete(Integer.parseInt(id));
			}
		}else {
			throw new Exception("Call function CodeTableService.deleteByIds ,Id can not be null.");
		}
	}
	
	public List<CodeTable> findByType(String type){
		Collection<SearchFilter> filters = null;
		Specification<CodeTable> spec = null;
		filters =new ArrayList<SearchFilter>();
		SearchFilter filter = null;
		filter = new SearchFilter("type", Operator.EQ, type);
		filters.add(filter);
		spec = DynamicSpecifications.bySearchFilter(filters,CodeTable.class);
		return this.codeTableRepo.findAll(spec);
	}
	
	public String findDesc(String type,String code){
		CodeTable codeTable = this.findOne(type, code);
		return codeTable!=null ? codeTable.getDescription() : "";
	}
	
	public CodeTable findOne(String type,String code){
		Collection<SearchFilter> filters = null;
		Specification<CodeTable> spec = null;
		filters =new ArrayList<SearchFilter>();
		SearchFilter filter = null;
		filter = new SearchFilter("type", Operator.EQ, type);
		filters.add(filter);
		filter = new SearchFilter("code", Operator.EQ, code);
		filters.add(filter);
		spec = DynamicSpecifications.bySearchFilter(filters,CodeTable.class);
		return this.codeTableRepo.findOne(spec);
	}
}
