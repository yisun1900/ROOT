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
	String cw_gdsgjsd_khbh=null;
	String crm_khxx_khxm=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_lxfs=null;
	String crm_khxx_hth=null;
	String crm_khxx_sjs=null;
	String cw_gdsgjsd_lrr=null;
	String cw_gdsgjsd_lrsj=null;
	String cw_gdsgjsd_lrbm=null;
	cw_gdsgjsd_khbh=request.getParameter("cw_gdsgjsd_khbh");
	if (cw_gdsgjsd_khbh!=null)
	{
		cw_gdsgjsd_khbh=cf.GB2Uni(cw_gdsgjsd_khbh);
		if (!(cw_gdsgjsd_khbh.equals("")))	wheresql+=" and  (cw_gdsgjsd.khbh='"+cw_gdsgjsd_khbh+"')";
	}
	crm_khxx_khxm=request.getParameter("crm_khxx_khxm");
	if (crm_khxx_khxm!=null)
	{
		crm_khxx_khxm=cf.GB2Uni(crm_khxx_khxm);
		if (!(crm_khxx_khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm='"+crm_khxx_khxm+"')";
	}
	crm_khxx_fwdz=request.getParameter("crm_khxx_fwdz");
	if (crm_khxx_fwdz!=null)
	{
		crm_khxx_fwdz=cf.GB2Uni(crm_khxx_fwdz);
		if (!(crm_khxx_fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz='"+crm_khxx_fwdz+"')";
	}
	crm_khxx_lxfs=request.getParameter("crm_khxx_lxfs");
	if (crm_khxx_lxfs!=null)
	{
		crm_khxx_lxfs=cf.GB2Uni(crm_khxx_lxfs);
		if (!(crm_khxx_lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs='"+crm_khxx_lxfs+"')";
	}
	crm_khxx_hth=request.getParameter("crm_khxx_hth");
	if (crm_khxx_hth!=null)
	{
		crm_khxx_hth=cf.GB2Uni(crm_khxx_hth);
		if (!(crm_khxx_hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+crm_khxx_hth+"')";
	}
	crm_khxx_sjs=request.getParameter("crm_khxx_sjs");
	if (crm_khxx_sjs!=null)
	{
		crm_khxx_sjs=cf.GB2Uni(crm_khxx_sjs);
		if (!(crm_khxx_sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+crm_khxx_sjs+"')";
	}
	cw_gdsgjsd_lrr=request.getParameter("cw_gdsgjsd_lrr");
	if (cw_gdsgjsd_lrr!=null)
	{
		cw_gdsgjsd_lrr=cf.GB2Uni(cw_gdsgjsd_lrr);
		if (!(cw_gdsgjsd_lrr.equals("")))	wheresql+=" and  (cw_gdsgjsd.lrr='"+cw_gdsgjsd_lrr+"')";
	}
	cw_gdsgjsd_lrsj=request.getParameter("cw_gdsgjsd_lrsj");
	if (cw_gdsgjsd_lrsj!=null)
	{
		cw_gdsgjsd_lrsj=cw_gdsgjsd_lrsj.trim();
		if (!(cw_gdsgjsd_lrsj.equals("")))	wheresql+="  and (cw_gdsgjsd.lrsj>=TO_DATE('"+cw_gdsgjsd_lrsj+"','YYYY/MM/DD'))";
	}
	cw_gdsgjsd_lrsj=request.getParameter("cw_gdsgjsd_lrsj2");
	if (cw_gdsgjsd_lrsj!=null)
	{
		cw_gdsgjsd_lrsj=cw_gdsgjsd_lrsj.trim();
		if (!(cw_gdsgjsd_lrsj.equals("")))	wheresql+="  and (cw_gdsgjsd.lrsj<=TO_DATE('"+cw_gdsgjsd_lrsj+"','YYYY/MM/DD'))";
	}
	cw_gdsgjsd_lrbm=request.getParameter("cw_gdsgjsd_lrbm");
	if (cw_gdsgjsd_lrbm!=null)
	{
		cw_gdsgjsd_lrbm=cf.GB2Uni(cw_gdsgjsd_lrbm);
		if (!(cw_gdsgjsd_lrbm.equals("")))	wheresql+=" and  (cw_gdsgjsd.lrbm='"+cw_gdsgjsd_lrbm+"')";
	}
	ls_sql="SELECT cw_gdsgjsd.khbh,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.lxfs,crm_khxx.hth,crm_khxx.sjs,cw_gdsgjsd.wdzje,cw_gdsgjsd.wtj,cw_gdsgjsd.wtjrq,cw_gdsgjsd.ssk,cw_gdsgjsd.jsk,cw_gdsgjsd.jsrq,cw_gdsgjsd.mgfy,cw_gdsgjsd.mgrq,cw_gdsgjsd.sdgfy,cw_gdsgjsd.sdgrq,cw_gdsgjsd.nsgfy,cw_gdsgjsd.nsgrq,cw_gdsgjsd.yqgfy,cw_gdsgjsd.yqgrq,cw_gdsgjsd.fyze,cw_gdsgjsd.ye,cw_gdsgjsd.mll||'%',cw_gdsgjsd.lrr,cw_gdsgjsd.lrsj,dwmc,cw_gdsgjsd.bz  ";
	ls_sql+=" FROM crm_khxx,cw_gdsgjsd,sq_dwxx  ";
    ls_sql+=" where cw_gdsgjsd.khbh=crm_khxx.khbh and cw_gdsgjsd.lrbm=sq_dwxx.dwbh";
    ls_sql+=wheresql;
    ls_sql+=" order by cw_gdsgjsd.lrsj desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Cw_gdsgjsdList.jsp","SelectCw_gdsgjsd.jsp","","EditCw_gdsgjsd.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"khbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_lxfs","crm_khxx_hth","crm_khxx_sjs","cw_gdsgjsd_wdzje","cw_gdsgjsd_wtj","cw_gdsgjsd_wtjrq","cw_gdsgjsd_ssk","cw_gdsgjsd_jsk","cw_gdsgjsd_jsrq","cw_gdsgjsd_mgfy","cw_gdsgjsd_mgrq","cw_gdsgjsd_sdgfy","cw_gdsgjsd_sdgrq","cw_gdsgjsd_nsgfy","cw_gdsgjsd_nsgrq","cw_gdsgjsd_yqgfy","cw_gdsgjsd_yqgrq","cw_gdsgjsd_fyze","cw_gdsgjsd_ye","cw_gdsgjsd_mll","cw_gdsgjsd_lrr","cw_gdsgjsd_lrsj","cw_gdsgjsd_lrbm","cw_gdsgjsd_bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"khbh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Cw_gdsgjsdList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewCw_gdsgjsd.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
/*
//������������ʾ��ʽ
	pageObj.setKeyMark("SQL");//SQL��������SQL�ķ�ʽ��ʾ��PARAM��������"123*we*4455"�ķ�ʽ��ʾ
*/
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String[] khbh = request.getParameterValues("khbh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(khbh,"khbh"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[2];//Ҫִ�е�SQL
		boolean needCommit=true;//����Ҫ������
		sql[0]="delete from cw_gdfymx where "+chooseitem;
		sql[1]="delete from cw_gdsgjsd where "+chooseitem;
		pageObj.execDelete(sql,needCommit);
	}
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">��ѯ���</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(300);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="3%">�ͻ����</td>
	<td  width="3%">�ͻ�����</td>
	<td  width="8%">���ݵ�ַ</td>
	<td  width="5%">�绰</td>
	<td  width="3%">��ͬ��</td>
	<td  width="3%">���ʦ</td>
	<td  width="3%">����Ԥ���</td>
	<td  width="3%">ί�н�</td>
	<td  width="3%">ί�н�����</td>
	<td  width="3%">ʵ�տ�</td>
	<td  width="3%">�����</td>
	<td  width="3%">��������</td>
	<td  width="3%">ľ������</td>
	<td  width="3%">ľ������</td>
	<td  width="3%">ˮ�繤����</td>
	<td  width="3%">ˮ�繤����</td>
	<td  width="3%">��ˮ������</td>
	<td  width="3%">��ˮ������</td>
	<td  width="3%">���Ṥ����</td>
	<td  width="3%">���Ṥ����</td>
	<td  width="3%">֧�������ܶ�</td>
	<td  width="3%">���</td>
	<td  width="3%">ë����</td>
	<td  width="3%">¼����</td>
	<td  width="3%">¼��ʱ��</td>
	<td  width="5%">¼�벿��</td>
	<td  width="10%">��ע</td>
</tr>
<%
	pageObj.displayDateSum();
	pageObj.displayFoot();
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