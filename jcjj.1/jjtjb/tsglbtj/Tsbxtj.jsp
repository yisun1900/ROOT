<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
//������ʾ�ϲ���

	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}

	String ls_sql=null;
	String wheresql="";
	String sjfw=null;
	String sjfw2=null;
	String crm_tsbm_dwbh=null;

	sjfw=request.getParameter("sjfw");
	if (sjfw!=null)
	{
		if (!(sjfw.equals("")))	wheresql+="  and (crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY/MM/DD'))";
	}
	sjfw2=request.getParameter("sjfw2");
	if (sjfw2!=null)
	{
		if (!(sjfw2.equals("")))	wheresql+="  and (crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS'))";
	}

	String fgs=request.getParameter("fgs");
	String dwbh=request.getParameter("dwbh");
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	wheresql+=" and  (crm_tsjl.slbm in(select dwbh from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and ssdw='"+fgs+"'))";
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  crm_khxx.dwbh='"+dwbh+"'";
	}
	crm_tsbm_dwbh=request.getParameter("crm_tsbm_dwbh");
	if (crm_tsbm_dwbh!=null)
	{
		crm_tsbm_dwbh=cf.GB2Uni(crm_tsbm_dwbh);
		if (!(crm_tsbm_dwbh.equals("")))	wheresql+=" and  (crm_tsbm.dwbh='"+crm_tsbm_dwbh+"')";
	}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>�ͻ����������ձ���(<%=sjfw%>--<%=sjfw2%>)</B>
</CENTER>
<table border="1" width="150%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">���</td>
	<td  width="2%">�ͻ�����</td>
	<td  width="8%">���ݵ�ַ</td>
	<td  width="2%">���ʦ</td>
	<td  width="2%">ʩ����</td>
	<td  width="2%">�ʼ�</td>
	<td  width="3%">Ͷ�߼�¼��</td>
	<td  width="2%">�Ƿ��������</td>
	<td  width="2%">����ʽ</td>
	<td  width="3%">���س̶�</td>
	<td  width="15%">Ͷ�߱�������</td>
	<td  width="3%">�ͻ�Ҫ����ʱ��</td>
	<td  width="3%">�Ƿ���ط�</td>
	<td  width="3%">����ʱ��</td>
	<td  width="3%">�᰸״̬</td>
	<td  width="3%">Ͷ�߱���С��</td>
	<td  width="6%">Ͷ�߱���ԭ��</td>
	<td  width="5%">���β���</td>
	<td  width="4%">����״̬</td>
	<td  width="2%">¼����</td>
	<td  width="3%">¼��ʱ��</td>
	<td  width="3%">�طý��</td>
	<td  width="15%">�������</td>
	<td  width="3%">Ͷ��Ʒ��</td>
</tr>
<%

	ls_sql="SELECT rownum,crm_khxx.hth,crm_khxx.khbh,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.sjs,sgdmc sgd,crm_khxx.zjxm,crm_tsjl.tsjlh,DECODE(crm_tsjl.sftsqk,'Y','����','N','��') sftsqk,slfsmc,yzcdmc,crm_tsjl.tsnr,crm_tsjl.yqjjsj, DECODE(crm_tsjl.sfxhf,'Y','��ط�','N','����ط�') sfxhf,crm_tsjl.slsj, DECODE(crm_tsjl.clzt,'0','�ǿͷ��Ǽ�','1','�ͷ�����','2','�ڴ���','3','�᰸','9','������') jazt,tsxlmc,tsyymc,b.dwmc zrbm, DECODE(crm_tsbm.clzt,'0','δ֪ͨ','1','��֪ͨδ����','2','�ڴ���','3','�ѽ��') clzt,crm_tsbm.lrr,crm_tsbm.lrsj,hfjgmc,'��'||TO_CHAR(crm_tsbm.clsj,'YYYY-MM-DD')||'��'||crm_tsbm.clr||'����'||crm_tsbm.clqk clqk,gysmc tspp  ";
	ls_sql+=" FROM crm_khxx,crm_tsbm,crm_tsjl,crm_tspp,dm_tsxlbm,dm_tsyybm,dm_slfsbm,dm_yzcdbm,sq_sgd,sq_dwxx b,sq_gysxx c,dm_hfjgbm ";
    ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh(+) and crm_tsbm.tsjlh=crm_tspp.tsjlh(+) and crm_tsbm.tsyybm=crm_tspp.tsyybm(+) ";
    ls_sql+=" and crm_tsjl.khbh=crm_khxx.khbh and crm_tsbm.hfjgbm=dm_hfjgbm.hfjgbm(+)";
    ls_sql+=" and crm_tsbm.tsyybm=dm_tsyybm.tsyybm(+) and crm_tsbm.tsxlbm=dm_tsxlbm.tsxlbm(+)";
    ls_sql+=" and crm_tsjl.slfsbm=dm_slfsbm.slfsbm(+) and crm_tsjl.yzcdbm=dm_yzcdbm.yzcdbm(+) and crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and crm_tsbm.dwbh=b.dwbh(+) and crm_tspp.tspp=c.gysbh(+)";
	ls_sql+=" and crm_tsbm.tslxbm in ('12','23') ";
    ls_sql+=wheresql;
    ls_sql+=" order by rownum,crm_tsjl.tsjlh,crm_tsbm.tsxlbm,crm_tsbm.tsyybm";
	
	//out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");

//������ʾ��
	String[] disColName={"rownum","khxm","fwdz","sjs","sgd","zjxm","tsjlh","sftsqk","slfsmc","yzcdmc","tsnr","yqjjsj","sfxhf","slsj","jazt","tsxlmc","tsyymc","zrbm","clzt","lrr","lrsj","hfjgmc","clqk","tspp"};
	pageObj.setDisColName(disColName);

	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��
	pageObj.alignStr[2]="align='left'";
	pageObj.alignStr[10]="align='left'";
	pageObj.alignStr[22]="align='left'";

	Hashtable spanColHash=new Hashtable();
	spanColHash=new Hashtable();
	spanColHash.put("khxm","1");//�в����������Hash��
	spanColHash.put("fwdz","1");//�в����������Hash��
	spanColHash.put("sjs","1");//�в����������Hash��
	spanColHash.put("sgd","1");//�в����������Hash��
	spanColHash.put("zjxm","1");//�в����������Hash��
	spanColHash.put("tsjlh","1");//�в����������Hash��
	spanColHash.put("sftsqk","1");//�в����������Hash��
	spanColHash.put("slfsmc","1");//�в����������Hash��
	spanColHash.put("yzcdmc","1");//�в����������Hash��
	spanColHash.put("tsnr","1");//�в����������Hash��
	spanColHash.put("yqjjsj","1");//�в����������Hash��
	spanColHash.put("sfxhf","1");//�в����������Hash��
	spanColHash.put("slsj","1");//�в����������Hash��
	spanColHash.put("jazt","1");//�в����������Hash��
	spanColHash.put("tsxlmc","1");//�в����������Hash��
	spanColHash.put("tsyymc","1");//�в����������Hash��
	spanColHash.put("zrbm","1");//�в����������Hash��
	spanColHash.put("clzt","1");//�в����������Hash��clqk
	spanColHash.put("lrr","1");//�в����������Hash��clqk
	spanColHash.put("lrsj","1");//�в����������Hash��clqk
	spanColHash.put("hfjgmc","1");//�в����������Hash��clqk
	spanColHash.put("clqk","1");//�в����������Hash��clqk
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
	pageObj.out=out;
	pageObj.getDate(1);
	

	pageObj.displayDate();
	pageObj.displayFoot();
%> 
</table>

</body>
</html>