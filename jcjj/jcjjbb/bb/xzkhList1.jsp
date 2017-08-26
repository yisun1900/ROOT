<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	pageObj.setType("EXCEL",response);





	String wheresql="";
	String ls_sql=null;
	String fgsbh=request.getParameter("fgsbh");
	String cxrq=request.getParameter("cxrq");
	String cxrq2=request.getParameter("cxrq2");
	String ddrq=null;
	String mmwheresql=null;
	String cgwheresql=null;
	String jjwheresql=null;
	String zcwheresql=null;
	String mmwheresql2=null;
	String cgwheresql2=null;
	String jjwheresql2=null;
	String zcwheresql2=null;


	

	ddrq=cf.GB2Uni(request.getParameter("cxrq"));
	if (ddrq!=null)
	{
		if (!(ddrq.equals("")))
		{
			mmwheresql="  and (jc_mmydd.lrsj>=TO_DATE('"+ddrq+"','YYYY-MM-DD'))";
			cgwheresql="  and (jc_cgdd.lrsj>=TO_DATE('"+ddrq+"','YYYY-MM-DD'))";
			jjwheresql="  and (jc_jjdd.lrsj>=TO_DATE('"+ddrq+"','YYYY-MM-DD'))";
			zcwheresql="  and (jc_zcdd.lrsj>=TO_DATE('"+ddrq+"','YYYY-MM-DD'))";
			mmwheresql2=" and  (jc_mmydd.lrsj<TO_DATE('"+ddrq+"','YYYY-MM-DD'))";
			cgwheresql2=" and (jc_cgdd.lrsj<TO_DATE('"+ddrq+"','YYYY-MM-DD'))";
			jjwheresql2=" and  (jc_jjdd.lrsj<TO_DATE('"+ddrq+"','YYYY-MM-DD'))";
			zcwheresql2=" and (jc_zcdd.lrsj<TO_DATE('"+ddrq+"','YYYY-MM-DD'))";
           
		}
	}
	ddrq=cf.GB2Uni(request.getParameter("cxrq2"));
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


	ls_sql="SELECT  khbh,khxm,fwdz,lxfs,dwmc,lx,clgw,ztjjgw,xmzy,qs  FROM ";
	ls_sql+="( select crm_khxx.khbh,'ľ��' as lx ,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.lxfs,dwmc,jc_mmydd.clgw,jc_mmydd.ztjjgw,jc_mmydd.xmzy,jc_mmydd.htje as qs "; 
	ls_sql+=" from jc_mmydd,crm_khxx,sq_dwxx where crm_khxx.khbh=jc_mmydd.khbh and crm_khxx.dwbh=sq_dwxx.dwbh and crm_khxx.fgsbh='"+fgsbh+"'";//+mmwheresql;
	ls_sql+=mmwheresql;

	ls_sql+=" union all";

	ls_sql+=" select crm_khxx.khbh,'����' as lx,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.lxfs,dwmc,jc_cgdd.clgw,jc_cgdd.ztjjgw,jc_cgdd.xmzy,jc_cgdd.htze as qs  "; 
	ls_sql+=" from jc_cgdd,crm_khxx,sq_dwxx where crm_khxx.khbh=jc_cgdd.khbh and crm_khxx.dwbh=sq_dwxx.dwbh and crm_khxx.fgsbh='"+fgsbh+"' " ;//+cgwheresql;
	ls_sql+=cgwheresql;

	ls_sql+=" union all";

	ls_sql+=" select crm_khxx.khbh,'�Ҿ�' as lx, crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.lxfs,dwmc,jc_jjdd.clgw,jc_jjdd.ztjjgw,jc_jjdd.xmzy,jc_jjdd.htze as qs  "; 
	ls_sql+=" from jc_jjdd,crm_khxx,sq_dwxx where crm_khxx.khbh=jc_jjdd.khbh and crm_khxx.dwbh=sq_dwxx.dwbh and crm_khxx.fgsbh='"+fgsbh+"' ";//+jjwheresql;
	ls_sql+=jjwheresql;

	ls_sql+=" union all";

	ls_sql+=" select crm_khxx.khbh,'����' as lx,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.lxfs,dwmc,jc_zcdd.clgw,jc_zcdd.ztjjgw,jc_zcdd.xmzy,jc_zcdd.hkze as qs  "; 
	ls_sql+=" from jc_zcdd,crm_khxx,sq_dwxx where crm_khxx.khbh=jc_zcdd.khbh and crm_khxx.dwbh=sq_dwxx.dwbh and crm_khxx.fgsbh='"+fgsbh+"' ";//+zcwheresql;
	ls_sql+=zcwheresql;
	ls_sql+=" ) ";    

	ls_sql+="  where khbh in (";

		ls_sql+="( select crm_khxx.khbh from jc_mmydd,crm_khxx where crm_khxx.khbh=jc_mmydd.khbh and crm_khxx.fgsbh='"+fgsbh+"' ";//+mmwheresql;
		ls_sql+=mmwheresql;
		ls_sql+=" union all";
		ls_sql+=" select crm_khxx.khbh from jc_cgdd,crm_khxx where crm_khxx.khbh=jc_cgdd.khbh and crm_khxx.fgsbh='"+fgsbh+"'" ;//+cgwheresql;
		ls_sql+=cgwheresql;
		ls_sql+=" union all";
		ls_sql+=" select crm_khxx.khbh from jc_jjdd,crm_khxx where crm_khxx.khbh=jc_jjdd.khbh and crm_khxx.fgsbh='"+fgsbh+"' ";//+jjwheresql;
		ls_sql+=jjwheresql;
		ls_sql+=" union all";
		ls_sql+=" select crm_khxx.khbh from jc_zcdd,crm_khxx where crm_khxx.khbh=jc_zcdd.khbh and crm_khxx.fgsbh='"+fgsbh+"' ";//+zcwheresql;
		ls_sql+=zcwheresql;
		ls_sql+=" ) ";  
		
		ls_sql+="  minus ";
	
		ls_sql+="( select crm_khxx.khbh from jc_mmydd,crm_khxx where crm_khxx.khbh=jc_mmydd.khbh and crm_khxx.fgsbh='"+fgsbh+"' ";//+mmwheresql;
		ls_sql+=mmwheresql2;
		ls_sql+=" union all";
		ls_sql+=" select crm_khxx.khbh from jc_cgdd,crm_khxx where crm_khxx.khbh=jc_cgdd.khbh and crm_khxx.fgsbh='"+fgsbh+"'" ;//+cgwheresql;
		ls_sql+=cgwheresql2;
		ls_sql+=" union all";
		ls_sql+=" select crm_khxx.khbh from jc_jjdd,crm_khxx where crm_khxx.khbh=jc_jjdd.khbh and crm_khxx.fgsbh='"+fgsbh+"' ";//+jjwheresql;
		ls_sql+=jjwheresql2;
		ls_sql+=" union all";
		ls_sql+=" select crm_khxx.khbh from jc_zcdd,crm_khxx where crm_khxx.khbh=jc_zcdd.khbh and crm_khxx.fgsbh='"+fgsbh+"' ";//+zcwheresql;
		ls_sql+=zcwheresql2;
		ls_sql+=" ))";    
		ls_sql+=" order by khbh,lx";    
//		out.print(ls_sql);	
		pageObj.sql=ls_sql;
//���ж����ʼ��

	pageObj.initPage("","","","");


	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��


//��������
	String[] keyName={"khbh"};
	pageObj.setKey(keyName);


//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("khbh","1");//�в����������Hash��
	spanColHash.put("khxm","1");//�в����������Hash��
	spanColHash.put("fwdz","1");//�в����������Hash��
	spanColHash.put("lxfs","1");//�в����������Hash��
	spanColHash.put("dwmc","1");//�в����������Hash��
	spanColHash.put("clgw","1");//�в����������Hash��
	spanColHash.put("ztjjgw","1");//�в����������Hash��
	spanColHash.put("xmzy","1");//�в����������Hash��

	pageObj.setSpanCol(spanColHash);//�в����������Hash��



%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">�����ͻ�</font></B>
</CENTER>
<%
   
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
    <td  width="5%">�ͻ����</td>
	<td  width="6%">�ͻ�����</td>
	<td  width="16%">���ݵ�ַ</td>
	<td  width="10%">��ϵ��ʽ</td>
	<td  width="10%">����</td>
	<td  width="6%">������Ʒ</td>
	<td  width="6%">פ��Ҿӹ���</td>
	<td  width="6%">չ���Ҿӹ���</td>
	<td  width="6%">��ĿרԱ</td>
	<td  width="6%">������</td>

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