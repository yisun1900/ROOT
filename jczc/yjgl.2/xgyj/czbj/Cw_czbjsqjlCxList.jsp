<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String cw_czbjsqjl_khbh=null;
	String cw_czbjsqjl_sqsj=null;
	String cw_czbjsqjl_khxm=null;
	String cw_czbjsqjl_fgsbh=null;
	String cw_czbjsqjl_sqr=null;
	String cw_czbjsqjl_wcbz=null;
	String cw_czbjsqjl_wcsj=null;
	String cw_czbjsqjl_wcr=null;
	String cw_czbjsqjl_yjjzsj=null;
	String crm_khxx_hth=null;
	String cw_czbjsqjl_sfxyjjz=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_sjs=null;
	String crm_khxx_qyrq=null;
	String crm_khxx_dwbh=null;
	cw_czbjsqjl_khbh=request.getParameter("cw_czbjsqjl_khbh");
	if (cw_czbjsqjl_khbh!=null)
	{
		cw_czbjsqjl_khbh=cf.GB2Uni(cw_czbjsqjl_khbh);
		if (!(cw_czbjsqjl_khbh.equals("")))	wheresql+=" and  (cw_czbjsqjl.khbh='"+cw_czbjsqjl_khbh+"')";
	}
	cw_czbjsqjl_sqsj=request.getParameter("cw_czbjsqjl_sqsj");
	if (cw_czbjsqjl_sqsj!=null)
	{
		cw_czbjsqjl_sqsj=cw_czbjsqjl_sqsj.trim();
		if (!(cw_czbjsqjl_sqsj.equals("")))	wheresql+="  and (cw_czbjsqjl.sqsj>=TO_DATE('"+cw_czbjsqjl_sqsj+"','YYYY/MM/DD'))";
	}
	cw_czbjsqjl_sqsj=request.getParameter("cw_czbjsqjl_sqsj2");
	if (cw_czbjsqjl_sqsj!=null)
	{
		cw_czbjsqjl_sqsj=cw_czbjsqjl_sqsj.trim();
		if (!(cw_czbjsqjl_sqsj.equals("")))	wheresql+="  and (cw_czbjsqjl.sqsj<=TO_DATE('"+cw_czbjsqjl_sqsj+"','YYYY/MM/DD'))";
	}
	cw_czbjsqjl_khxm=request.getParameter("cw_czbjsqjl_khxm");
	if (cw_czbjsqjl_khxm!=null)
	{
		cw_czbjsqjl_khxm=cf.GB2Uni(cw_czbjsqjl_khxm);
		if (!(cw_czbjsqjl_khxm.equals("")))	wheresql+=" and  (cw_czbjsqjl.khxm='"+cw_czbjsqjl_khxm+"')";
	}
	cw_czbjsqjl_fgsbh=request.getParameter("cw_czbjsqjl_fgsbh");
	if (cw_czbjsqjl_fgsbh!=null)
	{
		cw_czbjsqjl_fgsbh=cf.GB2Uni(cw_czbjsqjl_fgsbh);
		if (!(cw_czbjsqjl_fgsbh.equals("")))	wheresql+=" and  (cw_czbjsqjl.fgsbh='"+cw_czbjsqjl_fgsbh+"')";
	}
	cw_czbjsqjl_sqr=request.getParameter("cw_czbjsqjl_sqr");
	if (cw_czbjsqjl_sqr!=null)
	{
		cw_czbjsqjl_sqr=cf.GB2Uni(cw_czbjsqjl_sqr);
		if (!(cw_czbjsqjl_sqr.equals("")))	wheresql+=" and  (cw_czbjsqjl.sqr='"+cw_czbjsqjl_sqr+"')";
	}
	cw_czbjsqjl_wcbz=request.getParameter("cw_czbjsqjl_wcbz");
	if (cw_czbjsqjl_wcbz!=null)
	{
		cw_czbjsqjl_wcbz=cf.GB2Uni(cw_czbjsqjl_wcbz);
		if (!(cw_czbjsqjl_wcbz.equals("")))	wheresql+=" and  (cw_czbjsqjl.wcbz='"+cw_czbjsqjl_wcbz+"')";
	}
	cw_czbjsqjl_wcsj=request.getParameter("cw_czbjsqjl_wcsj");
	if (cw_czbjsqjl_wcsj!=null)
	{
		cw_czbjsqjl_wcsj=cw_czbjsqjl_wcsj.trim();
		if (!(cw_czbjsqjl_wcsj.equals("")))	wheresql+="  and (cw_czbjsqjl.wcsj>=TO_DATE('"+cw_czbjsqjl_wcsj+"','YYYY/MM/DD'))";
	}
	cw_czbjsqjl_wcsj=request.getParameter("cw_czbjsqjl_wcsj2");
	if (cw_czbjsqjl_wcsj!=null)
	{
		cw_czbjsqjl_wcsj=cw_czbjsqjl_wcsj.trim();
		if (!(cw_czbjsqjl_wcsj.equals("")))	wheresql+="  and (cw_czbjsqjl.wcsj<=TO_DATE('"+cw_czbjsqjl_wcsj+"','YYYY/MM/DD'))";
	}
	cw_czbjsqjl_wcr=request.getParameter("cw_czbjsqjl_wcr");
	if (cw_czbjsqjl_wcr!=null)
	{
		cw_czbjsqjl_wcr=cf.GB2Uni(cw_czbjsqjl_wcr);
		if (!(cw_czbjsqjl_wcr.equals("")))	wheresql+=" and  (cw_czbjsqjl.wcr='"+cw_czbjsqjl_wcr+"')";
	}
	cw_czbjsqjl_yjjzsj=request.getParameter("cw_czbjsqjl_yjjzsj");
	if (cw_czbjsqjl_yjjzsj!=null)
	{
		cw_czbjsqjl_yjjzsj=cw_czbjsqjl_yjjzsj.trim();
		if (!(cw_czbjsqjl_yjjzsj.equals("")))	wheresql+="  and (cw_czbjsqjl.yjjzsj>=TO_DATE('"+cw_czbjsqjl_yjjzsj+"','YYYY/MM/DD'))";
	}
	cw_czbjsqjl_yjjzsj=request.getParameter("cw_czbjsqjl_yjjzsj2");
	if (cw_czbjsqjl_yjjzsj!=null)
	{
		cw_czbjsqjl_yjjzsj=cw_czbjsqjl_yjjzsj.trim();
		if (!(cw_czbjsqjl_yjjzsj.equals("")))	wheresql+="  and (cw_czbjsqjl.yjjzsj<=TO_DATE('"+cw_czbjsqjl_yjjzsj+"','YYYY/MM/DD'))";
	}
	crm_khxx_hth=request.getParameter("crm_khxx_hth");
	if (crm_khxx_hth!=null)
	{
		crm_khxx_hth=cf.GB2Uni(crm_khxx_hth);
		if (!(crm_khxx_hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+crm_khxx_hth+"')";
	}
	cw_czbjsqjl_sfxyjjz=request.getParameter("cw_czbjsqjl_sfxyjjz");
	if (cw_czbjsqjl_sfxyjjz!=null)
	{
		cw_czbjsqjl_sfxyjjz=cf.GB2Uni(cw_czbjsqjl_sfxyjjz);
		if (!(cw_czbjsqjl_sfxyjjz.equals("")))	wheresql+=" and  (cw_czbjsqjl.sfxyjjz='"+cw_czbjsqjl_sfxyjjz+"')";
	}
	crm_khxx_fwdz=request.getParameter("crm_khxx_fwdz");
	if (crm_khxx_fwdz!=null)
	{
		crm_khxx_fwdz=cf.GB2Uni(crm_khxx_fwdz);
		if (!(crm_khxx_fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz='"+crm_khxx_fwdz+"')";
	}
	crm_khxx_sjs=request.getParameter("crm_khxx_sjs");
	if (crm_khxx_sjs!=null)
	{
		crm_khxx_sjs=cf.GB2Uni(crm_khxx_sjs);
		if (!(crm_khxx_sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+crm_khxx_sjs+"')";
	}
	crm_khxx_qyrq=request.getParameter("crm_khxx_qyrq");
	if (crm_khxx_qyrq!=null)
	{
		crm_khxx_qyrq=crm_khxx_qyrq.trim();
		if (!(crm_khxx_qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq>=TO_DATE('"+crm_khxx_qyrq+"','YYYY/MM/DD'))";
	}
	crm_khxx_qyrq=request.getParameter("crm_khxx_qyrq2");
	if (crm_khxx_qyrq!=null)
	{
		crm_khxx_qyrq=crm_khxx_qyrq.trim();
		if (!(crm_khxx_qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq<=TO_DATE('"+crm_khxx_qyrq+"','YYYY/MM/DD'))";
	}
	crm_khxx_dwbh=request.getParameter("crm_khxx_dwbh");
	if (crm_khxx_dwbh!=null)
	{
		crm_khxx_dwbh=cf.GB2Uni(crm_khxx_dwbh);
		if (!(crm_khxx_dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+crm_khxx_dwbh+"')";
	}
	ls_sql="SELECT DECODE(cw_czbjsqjl.wcbz,'1','δ���','2','���','3','ҵ����ת'),DECODE(cw_czbjsqjl.sfxyjjz,'Y','��Ҫ','N','����Ҫ'),cw_czbjsqjl.yjjzsj,cw_czbjsqjl.khbh,crm_khxx.hth,cw_czbjsqjl.khxm,crm_khxx.fwdz,crm_khxx.sjs,crm_khxx.qyrq,dwmc,cw_czbjsqjl.sqsj,cw_czbjsqjl.sqr,cw_czbjsqjl.wcsj,cw_czbjsqjl.wcr,cw_czbjsqjl.gxqwdzgce,cw_czbjsqjl.gxqzkl,cw_czbjsqjl.gxqqye,cw_czbjsqjl.gxqsuijin,cw_czbjsqjl.gxqsuijinbfb,cw_czbjsqjl.gxqsjf,cw_czbjsqjl.gxqglf,cw_czbjsqjl.gxqzqguanlif,cw_czbjsqjl.gxqguanlif,cw_czbjsqjl.gxhwdzgce,cw_czbjsqjl.gxhzkl,cw_czbjsqjl.gxhqye,cw_czbjsqjl.gxhsuijin,cw_czbjsqjl.gxhsuijinbfb,cw_czbjsqjl.gxhsjf,cw_czbjsqjl.gxhglf,cw_czbjsqjl.gxhzqguanlif,cw_czbjsqjl.gxhguanlif,cw_czbjsqjl.bz";
	ls_sql+=" FROM crm_khxx,cw_czbjsqjl,sq_dwxx  ";
    ls_sql+=" where cw_czbjsqjl.khbh=crm_khxx.khbh and crm_khxx.dwbh=sq_dwxx.dwbh";
    ls_sql+=wheresql;
    ls_sql+=" order by cw_czbjsqjl.sqsj desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Cw_czbjsqjlCxList.jsp","SelectCxCw_czbjsqjl.jsp","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"khbh","sqsj","cw_czbjsqjl_khxm","cw_czbjsqjl_fgsbh","cw_czbjsqjl_sqr","cw_czbjsqjl_wcbz","cw_czbjsqjl_wcsj","cw_czbjsqjl_wcr","cw_czbjsqjl_yjjzsj","cw_czbjsqjl_gxqwdzgce","cw_czbjsqjl_gxqzkl","cw_czbjsqjl_gxqqye","cw_czbjsqjl_gxqsuijin","cw_czbjsqjl_gxqsuijinbfb","cw_czbjsqjl_gxqsjf","cw_czbjsqjl_gxqglf","cw_czbjsqjl_gxqguanlif","cw_czbjsqjl_gxhwdzgce","cw_czbjsqjl_gxhzkl","cw_czbjsqjl_gxhqye","cw_czbjsqjl_gxhsuijin","cw_czbjsqjl_gxhsuijinbfb","cw_czbjsqjl_gxhsjf","cw_czbjsqjl_gxhglf","cw_czbjsqjl_gxhguanlif","cw_czbjsqjl_bz","crm_khxx_hth","cw_czbjsqjl_sfxyjjz","crm_khxx_fwdz","crm_khxx_sjs","crm_khxx_qyrq","crm_khxx_dwbh"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"khbh","sqsj"};
	pageObj.setKey(keyName);

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">�������ۣ���ѯ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(320);
%>
   
   <tr bgcolor="#CCCCCC"  align="center"> 
    <td rowspan="2" width="2%">��ɱ�־</td>
    <td rowspan="2" width="2%">��ҵ����ת</td>
    <td rowspan="2" width="3%">ҵ����תʱ��</td>
    <td rowspan="2" width="2%">�ͻ����</td>
    <td rowspan="2" width="3%">��ͬ��</td>
    <td rowspan="2" width="3%">�ͻ�����</td>
    <td rowspan="2" width="7%">���ݵ�ַ</td>
    <td rowspan="2" width="3%">���ʦ</td>
    <td rowspan="2" width="3%">ǩԼ����</td>
    <td rowspan="2" width="5%">ǩԼ����</td>
    <td rowspan="2" width="3%">��Ȩʱ��</td>
    <td rowspan="2" width="2%">��Ȩ��</td>
    <td rowspan="2" width="3%">���ʱ��</td>
    <td rowspan="2" width="2%">�����</td>
    <td colspan="9" bgcolor="#CCCC99">����ǰ</td>
    <td colspan="9" bgcolor="#CCCCFF">���º�</td>
    <td rowspan="2" width="9%">��ע</td>
  </tr>
  <tr bgcolor="#CCCCCC"  align="center"> 
    <td  width="3%" bgcolor="#CCCC99">����ԭ����</td>
    <td  width="2%" bgcolor="#CCCC99">�ۿ���</td>
    <td  width="3%" bgcolor="#CCCC99">ǩԼ��</td>
    <td  width="3%" bgcolor="#CCCC99">˰��</td>
    <td  width="2%" bgcolor="#CCCC99">˰��ٷֱ�</td>
    <td  width="3%" bgcolor="#CCCC99">��Ʒ�</td>
    <td  width="2%" bgcolor="#CCCC99">�����</td>
    <td  width="3%" bgcolor="#CCCC99">��ǰ�����</td>
    <td  width="3%" bgcolor="#CCCC99">�ۺ�����</td>
    <td  width="3%" bgcolor="#CCCCFF">����ԭ����</td>
    <td  width="2%" bgcolor="#CCCCFF">�ۿ���</td>
    <td  width="3%" bgcolor="#CCCCFF">ǩԼ��</td>
    <td  width="3%" bgcolor="#CCCCFF">˰��</td>
    <td  width="2%" bgcolor="#CCCCFF">˰��ٷֱ�</td>
    <td  width="3%" bgcolor="#CCCCFF">��Ʒ�</td>
    <td  width="2%" bgcolor="#CCCCFF">�����</td>
    <td  width="3%" bgcolor="#CCCCFF">��ǰ�����</td>
    <td  width="3%" bgcolor="#CCCCFF">�ۺ�����</td>
  </tr>
<%
	pageObj.printDate();
	pageObj.printFoot();
%> 

</body>
<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>
</html>