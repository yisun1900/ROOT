<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String xsfg=request.getParameter("xsfg");
if (xsfg.equals("2"))
{
	pageObj.setType("EXCEL",response);
}

int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
String wheresql="";
String ls_sql=null;
String cxrq=request.getParameter("sjfw");
String cxrq2=request.getParameter("sjfw2");
String ddrq=null;
String mmwheresql=null;
String cgwheresql=null;
String jjwheresql=null;
String zcwheresql=null;
String dwbh=null;


if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	

	ddrq=cf.GB2Uni(request.getParameter("sjfw"));
	if (ddrq!=null)
	{
		if (!(ddrq.equals("")))
		{
			mmwheresql="  and (jc_mmydd.lrsj>=TO_DATE('"+ddrq+"','YYYY-MM-DD'))";
			cgwheresql="  and (jc_cgdd.lrsj>=TO_DATE('"+ddrq+"','YYYY-MM-DD'))";
			jjwheresql="  and (jc_jjdd.lrsj>=TO_DATE('"+ddrq+"','YYYY-MM-DD'))";
			zcwheresql="  and (jc_zcdd.lrsj>=TO_DATE('"+ddrq+"','YYYY-MM-DD'))";
           
		}
	}
	ddrq=cf.GB2Uni(request.getParameter("sjfw2"));
	if (ddrq!=null)
	{
		if (!(ddrq.equals("")))
		{
			mmwheresql+="  and (jc_mmydd.lrsj<=TO_DATE('"+ddrq+"','YYYY-MM-DD'))";
			cgwheresql+="  and (jc_cgdd.lrsj<=TO_DATE('"+ddrq+"','YYYY-MM-DD'))";
			jjwheresql+="  and (jc_jjdd.lrsj<=TO_DATE('"+ddrq+"','YYYY-MM-DD'))";
			zcwheresql+="  and (jc_zcdd.lrsj<=TO_DATE('"+ddrq+"','YYYY-MM-DD'))";
		}
	}
String lrxmzy=request.getParameter("xmzy");
if (lrxmzy!=null)
{
	lrxmzy=cf.GB2Uni(lrxmzy);
	if (!(lrxmzy.equals("")))	mmwheresql+=" and  (jc_mmydd.xmzy='"+lrxmzy+"')";
	if (!(lrxmzy.equals("")))	cgwheresql+=" and  (jc_cgdd.xmzy='"+lrxmzy+"')";
	if (!(lrxmzy.equals("")))	jjwheresql+=" and  (jc_jjdd.xmzy='"+lrxmzy+"')";
	if (!(lrxmzy.equals("")))	zcwheresql+=" and  (jc_zcdd.xmzy='"+lrxmzy+"')";
}
String lrztjjgw=request.getParameter("ztjjgw");
if (lrztjjgw!=null)
{
	lrxmzy=cf.GB2Uni(lrztjjgw);
	if (!(lrxmzy.equals("")))	mmwheresql+=" and  (jc_mmydd.ztjjgw='"+lrztjjgw+"')";
	if (!(lrxmzy.equals("")))	cgwheresql+=" and  (jc_cgdd.ztjjgw='"+lrztjjgw+"')";
	if (!(lrxmzy.equals("")))	jjwheresql+=" and  (jc_jjdd.ztjjgw='"+lrztjjgw+"')";
	if (!(lrxmzy.equals("")))	zcwheresql+=" and  (jc_zcdd.ztjjgw='"+lrztjjgw+"')";
}

String lrclgw=request.getParameter("clgw");
if (lrclgw!=null)
{
	lrclgw=cf.GB2Uni(lrclgw);
	if (!(lrxmzy.equals("")))	mmwheresql+=" and  (jc_mmydd.clgw='"+lrclgw+"')";
	if (!(lrxmzy.equals("")))	cgwheresql+=" and  (jc_cgdd.clgw='"+lrclgw+"')";
	if (!(lrxmzy.equals("")))	jjwheresql+=" and  (jc_jjdd.clgw='"+lrclgw+"')";
	if (!(lrxmzy.equals("")))	zcwheresql+=" and  (jc_zcdd.clgw='"+lrclgw+"')";
}
 dwbh=request.getParameter("dwbh");
if (dwbh!=null)
{
	if (!(dwbh.equals("")))	mmwheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
	if (!(dwbh.equals("")))	cgwheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
	if (!(dwbh.equals("")))	jjwheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
	if (!(dwbh.equals("")))	zcwheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
}



	ls_sql="SELECT  khbh,lx,khxm,dwmc,fwdz,lxfs,clgw,ztjjgw,xmzy,qs,lrsj  FROM ";
	ls_sql+="( select crm_khxx.khbh,'ľ��' as lx ,crm_khxx.khxm,sq_dwxx.dwmc,crm_khxx.fwdz,crm_khxx.lxfs,jc_mmydd.clgw,jc_mmydd.ztjjgw,jc_mmydd.xmzy,jc_mmydd.htje as qs,jc_mmydd.lrsj as lrsj "; 
	ls_sql+=" from jc_mmydd,crm_khxx,sq_dwxx where crm_khxx.dwbh=sq_dwxx.dwbh and crm_khxx.khbh=jc_mmydd.khbh";//+mmwheresql;
	ls_sql+=mmwheresql;
	ls_sql+=" union ";
	//ls_sql+=" select crm_khxx.khbh 
	ls_sql+=" select crm_khxx.khbh,'����' as lx,crm_khxx.khxm,sq_dwxx.dwmc,crm_khxx.fwdz,crm_khxx.lxfs,jc_cgdd.clgw,jc_cgdd.ztjjgw,jc_cgdd.xmzy,jc_cgdd.htze as qs ,jc_cgdd.lrsj as lrsj "; 
	ls_sql+=" from jc_cgdd,crm_khxx,sq_dwxx where crm_khxx.dwbh=sq_dwxx.dwbh and crm_khxx.khbh=jc_cgdd.khbh " ;//+cgwheresql;
	ls_sql+=cgwheresql;
	ls_sql+=" union ";
	//ls_sql+=" select crm_khxx.khbh
	ls_sql+=" select crm_khxx.khbh,'�Ҿ�' as lx, crm_khxx.khxm,sq_dwxx.dwmc,crm_khxx.fwdz,crm_khxx.lxfs,jc_jjdd.clgw,jc_jjdd.ztjjgw,jc_jjdd.xmzy,jc_jjdd.htze as qs ,jc_jjdd.lrsj as lrsj "; 
	ls_sql+=" from jc_jjdd,crm_khxx,sq_dwxx where crm_khxx.dwbh=sq_dwxx.dwbh and crm_khxx.khbh=jc_jjdd.khbh ";//+jjwheresql;
	ls_sql+=jjwheresql;
	ls_sql+=" union ";
	//ls_sql+=" select crm_khxx.khbh 
	ls_sql+=" select crm_khxx.khbh,'����' as lx,crm_khxx.khxm,sq_dwxx.dwmc,crm_khxx.fwdz,crm_khxx.lxfs,jc_zcdd.clgw,jc_zcdd.ztjjgw,jc_zcdd.xmzy,jc_zcdd.hkze as qs, jc_zcdd.lrsj as lrsj "; 
	ls_sql+=" from jc_zcdd,crm_khxx,sq_dwxx where crm_khxx.dwbh=sq_dwxx.dwbh and crm_khxx.khbh=jc_zcdd.khbh ";//+zcwheresql;
	ls_sql+=zcwheresql;
	ls_sql+=" ) order by khxm,lx";    
//out.print(ls_sql);	
	pageObj.sql=ls_sql;
//���ж����ʼ��
	//pageObj.initPage("xzkhList.jsp","SelectCxJc_cgdd.jsp","","/jcjj/dygl/cght.jsp");
	pageObj.initPage("xzkhList.jsp","JcjjDdtj.jsp","","");
	//pageObj.setEditStr("��ӡ");

	pageObj.setPageRow(2000);//����ÿҳ��ʾ��¼��
//������ʾ��
//	String[] //disColName={"ddbh","jc_cgdd_clzt","jc_cgdd_khxm","jc_cgdd_fwdz","jc_cgdd_hth","jc_cgdd_dj","jc_cgdd_cgsjs","jc_cgdd_kfcbz","jc_cgdd_khlx//","sq_dwxx_dwmc"};
//	pageObj.setDisColName(disColName);

//��������
	String[] keyName={"khbh"};
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
//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("khxm","1");//�в����������Hash��
	spanColHash.put("fwdz","1");//�в����������Hash��
	spanColHash.put("lxfs","1");//�в����������Hash��
	spanColHash.put("clgw","1");//�в����������Hash��
	spanColHash.put("ztjjgw","1");//�в����������Hash��
	spanColHash.put("xmzy","1");//�в����������Hash��
	spanColHash.put("dwmc","1");//�в����������Hash��
	//spanColHash.put("lx","1");//�в����������Hash��


	pageObj.setSpanCol(spanColHash);//�в����������Hash��

	/*coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"ddbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="ViewJc_cgdd.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("ddbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��*/
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
  <B><font size="3">���ɲ�Ʒ�����ͻ�ͳ�Ʊ�</font></B>
</CENTER>
<%
   
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();

%>
<tr bgcolor="#CCCCCC"  align="center">
    <td  width="4%">�ͻ����</td>
	<td  width="6%">������Ʒ</td>
	<td  width="6%">�ͻ�����</td>
	<td  width="8%">ǩԼ����</td>
	<td  width="12%">���ݵ�ַ</td>
	<td  width="6%">��ϵ��ʽ</td>
	<td  width="6%">פ��Ҿӹ���</td>
	<td  width="6%">չ���Ҿӹ���</td>
	<td  width="6%">��ĿרԱ</td>
	<td  width="6%">������</td>
	<td  width="6%">��������</td>

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

