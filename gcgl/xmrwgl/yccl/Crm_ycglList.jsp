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
	String crm_ycgl_ycdbh=null;
	String crm_ycgl_khbh=null;
	String crm_khxx_khxm=null;
	String crm_khxx_fwdz=null;
	String crm_khxx_hth=null;
	String crm_khxx_sjs=null;
	String crm_ycgl_ycflbm=null;
	String crm_ycgl_ycfssj=null;
	String crm_ycgl_zrr=null;
	String crm_ycgl_ycqksm=null;
	String crm_ycgl_fazdr=null;
	String crm_ycgl_fazdsj=null;
	String crm_ycgl_jhjjsj=null;
	String crm_ycgl_jjfa=null;
	String crm_ycgl_sjclr=null;
	String crm_ycgl_sjclsj=null;
	String crm_ycgl_sjclqk=null;
	String crm_ycgl_wcsj=null;
	String crm_ycgl_sfjj=null;
	String crm_ycgl_lrr=null;
	String crm_ycgl_lrsj=null;
	String crm_ycgl_lrbm=null;
	String crm_ycgl_bz=null;
	crm_ycgl_ycdbh=request.getParameter("crm_ycgl_ycdbh");
	if (crm_ycgl_ycdbh!=null)
	{
		crm_ycgl_ycdbh=cf.GB2Uni(crm_ycgl_ycdbh);
		if (!(crm_ycgl_ycdbh.equals("")))	wheresql+=" and  (crm_ycgl.ycdbh='"+crm_ycgl_ycdbh+"')";
	}
	crm_ycgl_khbh=request.getParameter("crm_ycgl_khbh");
	if (crm_ycgl_khbh!=null)
	{
		crm_ycgl_khbh=cf.GB2Uni(crm_ycgl_khbh);
		if (!(crm_ycgl_khbh.equals("")))	wheresql+=" and  (crm_ycgl.khbh='"+crm_ycgl_khbh+"')";
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
	crm_ycgl_ycflbm=request.getParameter("crm_ycgl_ycflbm");
	if (crm_ycgl_ycflbm!=null)
	{
		crm_ycgl_ycflbm=cf.GB2Uni(crm_ycgl_ycflbm);
		if (!(crm_ycgl_ycflbm.equals("")))	wheresql+=" and  (crm_ycgl.ycflbm='"+crm_ycgl_ycflbm+"')";
	}
	crm_ycgl_ycfssj=request.getParameter("crm_ycgl_ycfssj");
	if (crm_ycgl_ycfssj!=null)
	{
		crm_ycgl_ycfssj=crm_ycgl_ycfssj.trim();
		if (!(crm_ycgl_ycfssj.equals("")))	wheresql+="  and (crm_ycgl.ycfssj=TO_DATE('"+crm_ycgl_ycfssj+"','YYYY/MM/DD'))";
	}
	crm_ycgl_zrr=request.getParameter("crm_ycgl_zrr");
	if (crm_ycgl_zrr!=null)
	{
		crm_ycgl_zrr=cf.GB2Uni(crm_ycgl_zrr);
		if (!(crm_ycgl_zrr.equals("")))	wheresql+=" and  (crm_ycgl.zrr='"+crm_ycgl_zrr+"')";
	}
	crm_ycgl_ycqksm=request.getParameter("crm_ycgl_ycqksm");
	if (crm_ycgl_ycqksm!=null)
	{
		crm_ycgl_ycqksm=cf.GB2Uni(crm_ycgl_ycqksm);
		if (!(crm_ycgl_ycqksm.equals("")))	wheresql+=" and  (crm_ycgl.ycqksm='"+crm_ycgl_ycqksm+"')";
	}
	crm_ycgl_fazdr=request.getParameter("crm_ycgl_fazdr");
	if (crm_ycgl_fazdr!=null)
	{
		crm_ycgl_fazdr=cf.GB2Uni(crm_ycgl_fazdr);
		if (!(crm_ycgl_fazdr.equals("")))	wheresql+=" and  (crm_ycgl.fazdr='"+crm_ycgl_fazdr+"')";
	}
	crm_ycgl_fazdsj=request.getParameter("crm_ycgl_fazdsj");
	if (crm_ycgl_fazdsj!=null)
	{
		crm_ycgl_fazdsj=crm_ycgl_fazdsj.trim();
		if (!(crm_ycgl_fazdsj.equals("")))	wheresql+="  and (crm_ycgl.fazdsj=TO_DATE('"+crm_ycgl_fazdsj+"','YYYY/MM/DD'))";
	}
	crm_ycgl_jhjjsj=request.getParameter("crm_ycgl_jhjjsj");
	if (crm_ycgl_jhjjsj!=null)
	{
		crm_ycgl_jhjjsj=crm_ycgl_jhjjsj.trim();
		if (!(crm_ycgl_jhjjsj.equals("")))	wheresql+="  and (crm_ycgl.jhjjsj=TO_DATE('"+crm_ycgl_jhjjsj+"','YYYY/MM/DD'))";
	}
	crm_ycgl_jjfa=request.getParameter("crm_ycgl_jjfa");
	if (crm_ycgl_jjfa!=null)
	{
		crm_ycgl_jjfa=cf.GB2Uni(crm_ycgl_jjfa);
		if (!(crm_ycgl_jjfa.equals("")))	wheresql+=" and  (crm_ycgl.jjfa='"+crm_ycgl_jjfa+"')";
	}
	crm_ycgl_sjclr=request.getParameter("crm_ycgl_sjclr");
	if (crm_ycgl_sjclr!=null)
	{
		crm_ycgl_sjclr=cf.GB2Uni(crm_ycgl_sjclr);
		if (!(crm_ycgl_sjclr.equals("")))	wheresql+=" and  (crm_ycgl.sjclr='"+crm_ycgl_sjclr+"')";
	}
	crm_ycgl_sjclsj=request.getParameter("crm_ycgl_sjclsj");
	if (crm_ycgl_sjclsj!=null)
	{
		crm_ycgl_sjclsj=crm_ycgl_sjclsj.trim();
		if (!(crm_ycgl_sjclsj.equals("")))	wheresql+="  and (crm_ycgl.sjclsj=TO_DATE('"+crm_ycgl_sjclsj+"','YYYY/MM/DD'))";
	}
	crm_ycgl_sjclqk=request.getParameter("crm_ycgl_sjclqk");
	if (crm_ycgl_sjclqk!=null)
	{
		crm_ycgl_sjclqk=cf.GB2Uni(crm_ycgl_sjclqk);
		if (!(crm_ycgl_sjclqk.equals("")))	wheresql+=" and  (crm_ycgl.sjclqk='"+crm_ycgl_sjclqk+"')";
	}
	crm_ycgl_wcsj=request.getParameter("crm_ycgl_wcsj");
	if (crm_ycgl_wcsj!=null)
	{
		crm_ycgl_wcsj=crm_ycgl_wcsj.trim();
		if (!(crm_ycgl_wcsj.equals("")))	wheresql+="  and (crm_ycgl.wcsj=TO_DATE('"+crm_ycgl_wcsj+"','YYYY/MM/DD'))";
	}
	crm_ycgl_sfjj=request.getParameter("crm_ycgl_sfjj");
	if (crm_ycgl_sfjj!=null)
	{
		crm_ycgl_sfjj=cf.GB2Uni(crm_ycgl_sfjj);
		if (!(crm_ycgl_sfjj.equals("")))	wheresql+=" and  (crm_ycgl.sfjj='"+crm_ycgl_sfjj+"')";
	}
	crm_ycgl_lrr=request.getParameter("crm_ycgl_lrr");
	if (crm_ycgl_lrr!=null)
	{
		crm_ycgl_lrr=cf.GB2Uni(crm_ycgl_lrr);
		if (!(crm_ycgl_lrr.equals("")))	wheresql+=" and  (crm_ycgl.lrr='"+crm_ycgl_lrr+"')";
	}
	crm_ycgl_lrsj=request.getParameter("crm_ycgl_lrsj");
	if (crm_ycgl_lrsj!=null)
	{
		crm_ycgl_lrsj=crm_ycgl_lrsj.trim();
		if (!(crm_ycgl_lrsj.equals("")))	wheresql+="  and (crm_ycgl.lrsj=TO_DATE('"+crm_ycgl_lrsj+"','YYYY/MM/DD'))";
	}
	crm_ycgl_lrbm=request.getParameter("crm_ycgl_lrbm");
	if (crm_ycgl_lrbm!=null)
	{
		crm_ycgl_lrbm=cf.GB2Uni(crm_ycgl_lrbm);
		if (!(crm_ycgl_lrbm.equals("")))	wheresql+=" and  (crm_ycgl.lrbm='"+crm_ycgl_lrbm+"')";
	}
	crm_ycgl_bz=request.getParameter("crm_ycgl_bz");
	if (crm_ycgl_bz!=null)
	{
		crm_ycgl_bz=cf.GB2Uni(crm_ycgl_bz);
		if (!(crm_ycgl_bz.equals("")))	wheresql+=" and  (crm_ycgl.bz='"+crm_ycgl_bz+"')";
	}
	ls_sql="SELECT crm_ycgl.ycdbh,crm_ycgl.khbh,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.hth,crm_khxx.sjs,crm_ycgl.ycflbm,crm_ycgl.ycfssj,crm_ycgl.zrr,crm_ycgl.ycqksm,crm_ycgl.fazdr,crm_ycgl.fazdsj,crm_ycgl.jhjjsj,crm_ycgl.jjfa,crm_ycgl.sjclr,crm_ycgl.sjclsj,crm_ycgl.sjclqk,crm_ycgl.wcsj, DECODE(crm_ycgl.sfjj,'1','¼���쳣','2','�ƶ�����','3','���'),crm_ycgl.lrr,crm_ycgl.lrsj,crm_ycgl.lrbm,crm_ycgl.bz  ";
	ls_sql+=" FROM crm_khxx,crm_ycgl  ";
    ls_sql+=" where crm_ycgl.khbh=crm_khxx.khbh(+)";
    ls_sql+=wheresql;
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Crm_ycglList.jsp","","","EditCrm_ycgl.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"ycdbh","crm_ycgl_khbh","crm_khxx_khxm","crm_khxx_fwdz","crm_khxx_hth","crm_khxx_sjs","crm_ycgl_ycflbm","crm_ycgl_ycfssj","crm_ycgl_zrr","crm_ycgl_ycqksm","crm_ycgl_fazdr","crm_ycgl_fazdsj","crm_ycgl_jhjjsj","crm_ycgl_jjfa","crm_ycgl_sjclr","crm_ycgl_sjclsj","crm_ycgl_sjclqk","crm_ycgl_wcsj","crm_ycgl_sfjj","crm_ycgl_lrr","crm_ycgl_lrsj","crm_ycgl_lrbm","crm_ycgl_bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"ycdbh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Crm_ycglList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
/*
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"saleid","corpid"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="link.jsp?";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("saleid",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
//������������ʾ��ʽ
	pageObj.setKeyMark("SQL");//SQL��������SQL�ķ�ʽ��ʾ��PARAM��������"123*we*4455"�ķ�ʽ��ʾ
*/
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String[] ycdbh = request.getParameterValues("ycdbh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(ycdbh,"ycdbh"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from crm_ycgl where "+chooseitem;
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
	<td  width="5%">&nbsp;</td>
	<td  width="3%">�쳣�����</td>
	<td  width="3%">�ͻ����</td>
	<td  width="3%">�ͻ�����</td>
	<td  width="3%">���ݵ�ַ</td>
	<td  width="3%">��ͬ��</td>
	<td  width="3%">���ʦ</td>
	<td  width="3%">�쳣����</td>
	<td  width="3%">�쳣����ʱ��</td>
	<td  width="3%">������</td>
	<td  width="3%">�쳣���˵��</td>
	<td  width="3%">�����ƶ���</td>
	<td  width="3%">�����ƶ�ʱ��</td>
	<td  width="3%">�ƻ����ʱ��</td>
	<td  width="3%">�������</td>
	<td  width="3%">ʵ�ʴ�����</td>
	<td  width="3%">ʵ�ʴ���ʱ��</td>
	<td  width="3%">ʵ�ʴ������</td>
	<td  width="3%">���ʱ��</td>
	<td  width="3%">�Ƿ���</td>
	<td  width="3%">¼����</td>
	<td  width="3%">¼��ʱ��</td>
	<td  width="3%">¼�벿��</td>
	<td  width="3%">��ע</td>
</tr>
<%
	pageObj.displayDate();
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